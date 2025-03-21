import 'package:edukit/ui/utils/form_submission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/models.dart';
import 'package:repositories/repositories.dart';
import 'package:uuid/uuid.dart';

part 'edit_form_state.dart';

/// Use bucketRepo
class EditFormCubit extends Cubit<EditFormData> {
  EditFormCubit() : super(EditFormData());

  void updateBucketName(String bucketName) {
    emit(state.copyWith(bucketName: bucketName));
  }

  void updateBucketDescription(String bucketDescription) {
    emit(state.copyWith(bucketDescription: bucketDescription));
  }

  void toggleFileType(DocumentType fileType) {
    final currentTypes = List<DocumentType>.from(state.fileTypes);
    if (currentTypes.contains(fileType)) {
      currentTypes.remove(fileType);
    } else {
      currentTypes.add(fileType);
    }
    emit(state.copyWith(fileTypes: currentTypes));
  }

  void setFileTypes(List<DocumentType> fileTypes) {
    emit(state.copyWith(fileTypes: fileTypes));
  }

  void onSubmit() async {
    try {
      var bucket = state.toBucket(orgRepo.orgId!);
      if (bucket != null) {
        emit(state.inProgress());
        await bucketRepo.create(bucket);
        emit(state.success(bucket.bucketId));
      }
    } catch (e) {
      emit(state.failure(e.toString()));
    }
  }

  void setError(String? errorMessage) {
    emit(state.copyWith(errorMessage: errorMessage));
  }

  /// Initialize form with an existing bucket (for editing)
  void initWithBucket(Bucket bucket) {
    emit(
      EditFormData(
        bucketName: bucket.title,
        bucketDescription: bucket.description,
        fileTypes: bucket.fileTypes,
        errorMessage: null,
      ),
    );
  }

  /// Reset form to empty state
  void reset() => emit(EditFormData());
}
