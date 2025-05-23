part of 'storage_service.dart';

class StorageManager {
  /// Private static instance of the singleton
  StorageManager._();

  final ValueNotifier<List<UploadTask>> _uploadTasks = ValueNotifier(const []);

  ValueNotifier<List<UploadTask>> get uploadTasks => _uploadTasks;

  void removeTaskAtIndex(int index) {
    uploadTasks.value = List.from(uploadTasks.value)..removeAt(index);
  }

  /*------------Pick files from device----------------- */
  Future<List<XFile>> pickMultiFiles(List<String> allowedExtensions) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: allowedExtensions,
      allowCompression: false,
      lockParentWindow: true,
      type: FileType.custom,
    );
    if (result != null && result.xFiles.isNotEmpty) {
      return result.xFiles;
    }
    throw Exception('No files selected');
  }

  /*-------Upload mulitple files in parallel------*/
  void uploadFiles(List<XFile> files) async {
    List<UploadTask> tasks = await files.map(_uploadFile).wait;

    if (tasks.isNotEmpty) {
      _uploadTasks.value = [..._uploadTasks.value, ...tasks];
    }
  }

  Future<UploadTask> _uploadFile(XFile file) async {
    UploadTask uploadTask;

    final ext = file.extension;

    final metadata = SettableMetadata(
      contentType: getMimeType(ext),
      customMetadata: {'picked-file-path': file.path},
    );

    final now = DateTime.now();

    final ref = FirebaseStorage.instance
        .ref()
        .child('${now.year}${now.month}')
        .child('/${Uuid().v4()}.$ext');

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }

    return Future.value(uploadTask);
  }

  /*----------------Download file---------------- */
  Future<void> downloadSaveAs(Reference ref) async {
    final bytes = await ref.getData();
    // Download...
    await saveAsBytes(bytes!, ref.name);
  }

  Future<String> downloadLink(Reference ref) async => await ref.getDownloadURL();

  Future<void> downloadFile(Reference ref) async {
    // code here
  }

  Future<void> downloadMultipleFiles(List<Reference> refs) async {
    // code here
  }

  Future<void> delete(Reference ref) async => await ref.delete();

  Future<void> deleteAll(List<Reference> refs) async =>
      await refs.map((e) => e.delete()).wait;

  /*----------------Usefull utility---------------- */
  /// Displays the current transferred percentage.
  double percentage(TaskSnapshot snapshot) =>
      (snapshot.bytesTransferred / snapshot.totalBytes) * 100;

  Reference createRef(String fullPath) => FirebaseStorage.instance.ref(fullPath);
}
