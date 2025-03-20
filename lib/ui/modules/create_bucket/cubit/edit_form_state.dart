part of 'edit_form_cubit.dart';

class EditFormData {
  final String? bucketId;
  final String bucketName;
  final String bucketDescription;
  final List<DocumentType> fileTypes;
  final FormSubmissionStatus status;
  final String? errorMessage;

  const EditFormData({
    this.bucketId,
    this.bucketName = '',
    this.bucketDescription = '',
    this.fileTypes = const [],
    this.status = FormSubmissionStatus.initial,
    this.errorMessage,
  });

  bool get isProgress => status == FormSubmissionStatus.inProgress;
  bool get isSuccess => status == FormSubmissionStatus.success;

  EditFormData inProgress() =>
      copyWith(status: FormSubmissionStatus.inProgress);
  EditFormData success(String bucketId) =>
      copyWith(status: FormSubmissionStatus.success, bucketId: bucketId);
  EditFormData failure(String msg) =>
      copyWith(status: FormSubmissionStatus.failure, errorMessage: msg);

  EditFormData copyWith({
    String? bucketId,
    String? bucketName,
    String? bucketDescription,
    List<DocumentType>? fileTypes,
    FormSubmissionStatus? status,
    String? errorMessage,
  }) {
    return EditFormData(
      bucketId: bucketId ?? this.bucketId,
      bucketName: bucketName ?? this.bucketName,
      bucketDescription: bucketDescription ?? this.bucketDescription,
      fileTypes: fileTypes ?? this.fileTypes,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  bool get isValid {
    return bucketName.isNotEmpty &&
        bucketDescription.isNotEmpty &&
        fileTypes.isNotEmpty;
  }

  String? get nameError => bucketName.isEmpty ? 'Name cannot be empty' : null;

  String? get descriptionError =>
      bucketDescription.isEmpty ? 'Description cannot be empty' : null;

  String? get fileTypesError =>
      fileTypes.isEmpty ? 'Select at least one file type' : null;

  Bucket? toBucket(String orgId) {
    if (!isValid) return null;
    return Bucket(
      bucketId: Uuid().v4(),
      title: bucketName,
      description: bucketDescription,
      fileTypes: fileTypes,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      attributes: [],
      orgId: orgId,
    );
  }
}
