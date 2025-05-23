part of 'file_base.dart';

class FileApi extends ApiBase implements FileBase {
  final CollectionReference colRef;

  FileApi({FirebaseFirestore? firestore})
    : colRef = (firestore ?? FirebaseFirestore.instance).collection('files');

  @override
  Future<void> create(DocumentFile file) async {
    await colRef.doc(file.fileId).set(file.toFireStore());
  }

  @override
  Future<void> update(DocumentFile file) async {
    await colRef.doc(file.fileId).update(file.toFireStore());
  }

  @override
  Future<void> delete(String fileId) async {
    await colRef.doc(fileId).delete();
  }

  @override
  Future<List<DocumentFile>> getFileByBucketId(String bucketId) async {
    try {
      final snapshot =
          await colRef
              .where('bucketId', isEqualTo: bucketId)
              .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
              .get();

      return snapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw Exception('Failed to get files: $e');
    }
  }

  @override
  Future<DocumentFile?> getFilesByQuery(String fileId) async {
    try {
      final snapshot =
          await colRef
              .doc(fileId)
              .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
              .get();

      if (snapshot.data() == null || !snapshot.exists) throw Exception('File not found');
      return snapshot.data();
    } catch (e) {
      throw Exception('Failed to get file: $e');
    }
  }

  // @override
  // Future<List<DocumentFile?>> getFilesByQuery(
  //   List<Filter> filters, {

  // }) async {
  //   try {
  //     if (filters.isEmpty) return const [];
  //     Filter filter = Filter.and(Filter(field), filter2);

  //     return snapshot.docs.map((e) => e.data()).toList();
  //   } catch (e) {
  //     throw Exception('Failed to get file: $e');
  //   }
  // }

  DocumentFile _fromFirestore(snapshot, _) =>
      DocumentFile.fromFireStore(snapshot.data()!);
  Map<String, Object?> _toFirestore(file, _) => file.toFireStore();
}
