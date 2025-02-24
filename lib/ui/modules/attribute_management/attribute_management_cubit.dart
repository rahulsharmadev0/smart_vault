import 'package:collection/collection.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/models.dart';

typedef AttributeManagementState = List<Attribute>?;

class AttributeManagementState {
  final List<Attribute> fixedAttributes;
  final List<Attribute> customAttributes;

  AttributeManagementState({
    required this.fixedAttributes,
    required this.customAttributes,
  });
}

class AttributeManagementCubit extends Cubit<AttributeManagementState> {
  final String bucketId;
  final BucketBloc bucketBloc;
  String get title => _bucket?.title ?? '';
  String get description => _bucket?.description ?? '';
  Bucket? _bucket;

  AttributeManagementCubit(this.bucketId, this.bucketBloc) : super(null) {
    _bucket = bucketBloc.state.mapOrNull(
        loaded: (state) => state.bucket.firstWhereOrNull((element) => element.bucketId == bucketId));

    bucketBloc.stream.listen((state) {
      _bucket = state.mapOrNull(
          loaded: (state) => state.bucket.firstWhereOrNull((element) => element.bucketId == bucketId));
    });

    if (_bucket != null) {
      emit(_bucket!.attributes);
    }
  }

  void addAttribute(Attribute attribute) {
    final currentAttributes = state;
    if (currentAttributes == null) return;
    emit([...currentAttributes, attribute]);
  }

  void removeAttribute(int index) {
    final currentAttributes = state;
    if (currentAttributes == null) return;
    emit(currentAttributes..removeAt(index));
  }

  void onSubmitted() {
    final currentAttributes = state;
    if (currentAttributes == null || _bucket == null) return;
    var bucketEvent = BucketEvent.update(bucketId, _bucket!.copyWith(attributes: currentAttributes));
    bucketBloc.add(bucketEvent);
  }
}
