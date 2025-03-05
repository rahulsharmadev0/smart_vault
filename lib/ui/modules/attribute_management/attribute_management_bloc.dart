// ignore_for_file: library_private_types_in_public_api

import 'package:collection/collection.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/models/organization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'attribute_management_bloc.freezed.dart';

@freezed
class AttributeManagementEvent with _$AttributeManagementEvent {
  // ignore: unused_element
  const factory AttributeManagementEvent._init() = _Init;
  const factory AttributeManagementEvent.add(Attribute attribute) = _AddAttribute;
  const factory AttributeManagementEvent.update(Attribute attribute) = _UpdateAttribute;
  const factory AttributeManagementEvent.remove(int index) = _RemoveAttribute;
  const factory AttributeManagementEvent.onSubmitted() = _OnSubmitted;
}

@freezed
class AttributeManagementState with _$AttributeManagementState {
  const factory AttributeManagementState.loading() = AMLoading;
  const factory AttributeManagementState.error(String message) = AMError;
  const factory AttributeManagementState.loaded({
    required List<Attribute> fixedAttributes,
    required List<Attribute> customAttributes,
  }) = AMLoaded;
}

extension AttributeManagementStateExt on AttributeManagementState {
  T map<T>({
    T Function(AMLoading state)? loading,
    T Function(AMError state)? error,
    T Function(AMLoaded state)? loaded,
    T Function()? orElse,
  }) {
    // ignore: no_leading_underscores_for_local_identifiers
    T _else() => orElse?.call() ?? (throw StateError('Unhandled state type: $runtimeType'));
    return switch (this) {
      AMLoading value => loading?.call(value) ?? _else(),
      AMError value => error?.call(value) ?? _else(),
      AMLoaded value => loaded?.call(value) ?? _else(),
      _ => _else(),
    };
  }
}

//==============================================================
//                  AttributeManagementBloc
//==============================================================

const _fixedAttributes = {'_name_': 'Name', '_unique_id_': 'Unique Id'};

class AttributeManagementBloc extends Bloc<AttributeManagementEvent, AttributeManagementState> {
  final String bucketId;
  final BucketBloc bucketBloc;
  AttributeManagementBloc({required this.bucketId, required this.bucketBloc})
    : super(const AttributeManagementState.loading()) {
    on<_Init>(_init);
    on<_AddAttribute>(_addAttribute);
    on<_RemoveAttribute>(_removeAttribute);
    on<_OnSubmitted>(_onSubmitted);
    on<_UpdateAttribute>(_updateAttribute);

    bucketBloc.stream.listen((event) {
      if (event is LoadedBucketState) add(const _Init());
    });
  }

  void _init(_Init event, Emitter emit) {
    if (this.state is AMLoaded) return;

    final state = bucketBloc.state as LoadedBucketState;
    final bucket = state.buckets.firstWhereOrNull((e) => e.bucketId == bucketId);
    if (bucket == null) {
      emit(AttributeManagementState.error('Bucket not found'));
      return;
    }

    // If bucket has no attributes, return fixed attributes
    if (bucket.attributes.isEmpty) {
      emit(
        AttributeManagementState.loaded(
          customAttributes: const [],
          fixedAttributes: [
            for (var entry in _fixedAttributes.entries)
              Attribute.text(attributeId: entry.key, label: entry.value),
          ],
        ),
      );
      return;
    }

    List<Attribute> customAttributes = [], fixedAttributes = [];
    for (var attribute in bucket.attributes) {
      if (_fixedAttributes.containsKey(attribute.attributeId)) {
        fixedAttributes.add(attribute);
      } else {
        customAttributes.add(attribute);
      }
    }

    emit(
      AttributeManagementState.loaded(fixedAttributes: fixedAttributes, customAttributes: customAttributes),
    );
  }

  void _updateAttribute(_UpdateAttribute event, Emitter emit) {
    _mapperEmit(emit, (state) {
      final fixedAttributes = [...state.fixedAttributes];
      final customAttributes = [...state.customAttributes];

      // Check in fixedAttributes first

      if (fixedAttributes.remove(event.attribute)) {
        fixedAttributes.add(event.attribute);
      } else if (customAttributes.remove(event.attribute)) {
        customAttributes.add(event.attribute);
      }

      return state.copyWith(fixedAttributes: fixedAttributes, customAttributes: customAttributes);
    });
  }

  void _addAttribute(_AddAttribute event, Emitter emit) {
    _mapperEmit(emit, (state) {
      var customAttributes = [...state.customAttributes, event.attribute];
      return state.copyWith(customAttributes: customAttributes);
    });
  }

  void _removeAttribute(_RemoveAttribute event, Emitter emit) {
    _mapperEmit(emit, (state) {
      final customAttributes = [...state.customAttributes]..removeAt(event.index);
      return state.copyWith(customAttributes: customAttributes);
    });
  }

  void _onSubmitted(_OnSubmitted event, Emitter emit) {
    var bucketState = bucketBloc.state;
    if (bucketState is! LoadedBucketState) return;

    _mapperEmit(emit, (state) {
      final bucket = bucketState.buckets.firstWhere((e) => e.bucketId == bucketId);

      // BucketEvent.update(bucket.orgId, bucket.copyWith(attributes: state.customAttributes));
      return state;
    });
  }

  /// Common method to update state
  void _mapperEmit(Emitter emit, AttributeManagementState Function(AMLoaded state) mapper) {
    var newState = state.map(
      loaded: (state) => mapper(state),
      orElse: () => AttributeManagementState.error('State is not loaded'),
    );
    emit(newState);
  }
}
