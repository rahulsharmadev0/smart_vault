import 'package:collection/collection.dart';
import 'package:dart_suite/dart_suite.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repositories/models/organization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'attribute_management_bloc.freezed.dart';

@freezed
class AttributeManagementEvent with _$AttributeManagementEvent {
  const factory AttributeManagementEvent.init() = _Init;
  const factory AttributeManagementEvent.addAttribute(Attribute attribute) = _AddAttribute;
  const factory AttributeManagementEvent.removeAttribute(int index) = _RemoveAttribute;
  const factory AttributeManagementEvent.onSubmitted() = _OnSubmitted;
}

@freezed
class AttributeManagementState with _$AttributeManagementState {
  const factory AttributeManagementState.loading() = _Loading;
  const factory AttributeManagementState.error(String message) = _Error;
  const factory AttributeManagementState.loaded({
    required List<Attribute> fixedAttributes,
    required List<Attribute> customAttributes,
  }) = _Loaded;
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
    on<AttributeManagementEvent>((event, emit) {
      final newState = event.map(
        init: _init,
        addAttribute: _addAttribute,
        removeAttribute: _removeAttribute,
        onSubmitted: _onSubmitted,
      );
      emit(newState);
    });
  }

  AttributeManagementState _init(_Init event) {
    if (state is _Loaded) return state;
    return bucketBloc.state.maybeMap(
      orElse: () => AttributeManagementState.error('Bucket State is not loaded'),
      loaded: (state) {
        final bucket = state.bucket.firstWhereOrNull((e) => e.bucketId == bucketId);

        if (bucket == null) {
          return AttributeManagementState.error('Bucket not found');
        }

        // If bucket has no attributes, return fixed attributes
        if (bucket.attributes.isEmpty) {
          return AttributeManagementState.loaded(
            customAttributes: const [],
            fixedAttributes: [
              for (var entry in _fixedAttributes.entries)
                Attribute.text(attributeId: entry.key, label: entry.value)
            ],
          );
        }

        List<Attribute> customAttributes = [], fixedAttributes = [];
        for (var attribute in bucket.attributes) {
          if (_fixedAttributes.containsKey(attribute.attributeId)) {
            fixedAttributes.add(attribute);
          } else {
            customAttributes.add(attribute);
          }
        }

        return AttributeManagementState.loaded(
          fixedAttributes: fixedAttributes,
          customAttributes: customAttributes,
        );
      },
    );
  }

  AttributeManagementState _addAttribute(_AddAttribute event) {
    return _mapper((state) {
      var customAttributes = [...state.customAttributes, event.attribute];
      return state.copyWith(customAttributes: customAttributes);
    });
  }

  AttributeManagementState _removeAttribute(_RemoveAttribute event) {
    return _mapper((state) {
      final customAttributes = [...state.customAttributes]..removeAt(event.index);
      return state.copyWith(customAttributes: customAttributes);
    });
  }

  AttributeManagementState _onSubmitted(_OnSubmitted event) {
    return _mapper((state) {
      final bucket = bucketBloc.state.mapOrNull(
        loaded: (state) => state.bucket.firstWhere((e) => e.bucketId == bucketId),
      );

      //TODO: Implement update method
      BucketEvent.update('orgId', bucket!.copyWith(attributes: state.customAttributes));
      return state;
    });
  }

  /// Common method to update state
  AttributeManagementState _mapper(Function(_Loaded state) mapper) {
    return state.maybeMap(
      orElse: () => AttributeManagementState.error('State is not loaded'),
      loaded: (state) => mapper(state),
    );
  }
}
