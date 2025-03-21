// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/models/organization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
part 'attribute_management_bloc.freezed.dart';

@freezed
abstract class AttributeManagementEvent with _$AttributeManagementEvent {
  // ignore: unused_element
  const factory AttributeManagementEvent._init() = _Init;
  const factory AttributeManagementEvent.add(Attribute attribute) = _AddAttribute;
  const factory AttributeManagementEvent.update(Attribute attribute) = _UpdateAttribute;
  const factory AttributeManagementEvent.remove(int index) = _RemoveAttribute;
  const factory AttributeManagementEvent.onSubmitted() = _OnSubmitted;
}

@freezed
abstract class AttributeManagementState with _$AttributeManagementState {
  const factory AttributeManagementState.loading() = AMLoading;
  const factory AttributeManagementState.error(String message) = AMError;
  const factory AttributeManagementState.loaded({
    required List<Attribute> fixedAttributes,
    required List<Attribute> customAttributes,
  }) = AMLoaded;
  const factory AttributeManagementState.submittedSuccessfully({
    required List<Attribute> fixedAttributes,
    required List<Attribute> customAttributes,
  }) = AMSubmittedSuccessfully;
}

extension AttributeManagementStateExt on AttributeManagementState {
  T map<T>({
    T Function(AMLoading state)? loading,
    T Function(AMError state)? error,
    T Function(AMLoaded state)? loaded,
    T Function(AMSubmittedSuccessfully state)? submittedSuccessfully,
    T Function()? orElse,
  }) {
    // ignore: no_leading_underscores_for_local_identifiers
    T _else() =>
        orElse?.call() ?? (throw StateError('Unhandled state type: $runtimeType'));
    return switch (this) {
      AMLoading value => loading?.call(value) ?? _else(),
      AMError value => error?.call(value) ?? _else(),
      AMLoaded value => loaded?.call(value) ?? _else(),
      AMSubmittedSuccessfully value => submittedSuccessfully?.call(value) ?? _else(),
      _ => _else(),
    };
  }
}

//==============================================================
//                  AttributeManagementBloc
//==============================================================

const fixedAttributesMap = {'_name_': 'Name', '_unique_id_': 'Unique Id'};

class AttributeManagementBloc
    extends Bloc<AttributeManagementEvent, AttributeManagementState> {
  final String bucketId;
  AttributeManagementBloc({required this.bucketId})
    : super(const AttributeManagementState.loading()) {
    on<_Init>(_init);
    on<_AddAttribute>(_addAttribute);
    on<_RemoveAttribute>(_removeAttribute);
    on<_OnSubmitted>(_onSubmitted);
    on<_UpdateAttribute>(_updateAttribute);

    add(const _Init());
  }

  void _init(_Init event, Emitter emit) async {
    if (state is AMLoaded) return;
    final bucket = await bucketRepo.getBucketById(bucketId);
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
            for (var entry in fixedAttributesMap.entries)
              Attribute.text(attributeId: entry.key, label: entry.value),
          ],
        ),
      );
      return;
    }

    List<Attribute> customAttributes = [], fixedAttributes = [];
    for (var attribute in bucket.attributes) {
      if (fixedAttributesMap.containsKey(attribute.attributeId)) {
        fixedAttributes.add(attribute);
      } else {
        customAttributes.add(attribute);
      }
    }
    emit(
      AttributeManagementState.loaded(
        fixedAttributes: fixedAttributes,
        customAttributes: customAttributes,
      ),
    );
  }

  void _updateAttribute(_UpdateAttribute event, Emitter emit) {
    _mapperEmit(emit, (state) {
      var fixedAttributes = [...state.fixedAttributes];
      var customAttributes = [...state.customAttributes];

      int idx = fixedAttributes.indexWhere(
        (e) => e.attributeId == event.attribute.attributeId,
      );

      if (idx != -1) {
        fixedAttributes[idx] = event.attribute;
      } else {
        idx = customAttributes.indexWhere(
          (e) => e.attributeId == event.attribute.attributeId,
        );
        if (idx != -1) customAttributes[idx] = event.attribute;
      }
      return state.copyWith(
        fixedAttributes: fixedAttributes,
        customAttributes: customAttributes,
      );
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

  void _onSubmitted(_OnSubmitted event, Emitter emit) async {
    if (this.state is! AMLoaded) return;
    var bucket = await bucketRepo.getBucketById(bucketId);

    final state = this.state as AMLoaded;
    var bucket2 = bucket!.copyWith(
      attributes: [...state.fixedAttributes, ...state.customAttributes],
    );
    await bucketRepo.update(bucket2);
    emit(
      AttributeManagementState.submittedSuccessfully(
        fixedAttributes: state.fixedAttributes,
        customAttributes: state.customAttributes,
      ),
    );
  }

  /// Common method to update state
  void _mapperEmit(
    Emitter emit,
    AttributeManagementState Function(AMLoaded state) mapper,
  ) {
    var newState = state.map(
      loaded: (o) => mapper(o),
      orElse: () => AttributeManagementState.error('State is not loaded'),
    );
    emit(newState);
  }
}
