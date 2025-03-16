import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edukit/ui/bloc/organization_bloc.dart';
import 'package:repositories/models/organization.dart';
import 'package:uuid/uuid.dart';

part 'edit_form_state.dart';

class EditFormCubit extends Cubit<EditFormState> {
  final OrganizationBloc orgBloc;

  EditFormCubit(this.orgBloc) : super(EditFormState.empty);

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

  void setSubmitting(bool isSubmitting) {
    emit(state.copyWith(isSubmitting: isSubmitting));
  }

  void setError(String? errorMessage) {
    emit(state.copyWith(errorMessage: errorMessage));
  }

  /// Initialize form with an existing bucket (for editing)
  void initWithBucket(Bucket bucket) {
    emit(
      EditFormState(
        bucketName: bucket.title,
        bucketDescription: bucket.description,
        fileTypes: bucket.fileTypes,
        isSubmitting: false,
        errorMessage: null,
      ),
    );
  }

  /// Reset form to empty state
  void reset() {
    emit(EditFormState.empty);
  }
}
