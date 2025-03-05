part of 'edit_form_cubit.dart';

class EditFormState {
  final String bucketName;
  final String bucketDescription;
  final List<DocumentType> fileTypes;
  final bool isSubmitting;
  final String? errorMessage;

  const EditFormState({
    required this.bucketName,
    required this.bucketDescription,
    required this.fileTypes,
    this.isSubmitting = false,
    this.errorMessage,
  });

  static const empty = EditFormState(bucketName: '', bucketDescription: '', fileTypes: []);

  EditFormState copyWith({
    String? bucketName,
    String? bucketDescription,
    List<DocumentType>? fileTypes,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return EditFormState(
      bucketName: bucketName ?? this.bucketName,
      bucketDescription: bucketDescription ?? this.bucketDescription,
      fileTypes: fileTypes ?? this.fileTypes,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }

  bool get isValid {
    return bucketName.isNotEmpty && bucketDescription.isNotEmpty && fileTypes.isNotEmpty;
  }

  String? get nameError => bucketName.isEmpty ? 'Name cannot be empty' : null;

  String? get descriptionError => bucketDescription.isEmpty ? 'Description cannot be empty' : null;

  String? get fileTypesError => fileTypes.isEmpty ? 'Select at least one file type' : null;

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
