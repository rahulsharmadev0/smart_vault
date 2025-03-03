import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repositories/models.dart';

class FileRepository {
  final CollectionReference colRef;
  FileRepository({FirebaseFirestore? firestore})
    : colRef = (firestore ?? FirebaseFirestore.instance).collection('organizations');

  Future<void> create(DocumentFile file) async {
    await colRef.doc(file.fileId).set(file.toFireStore());
  }

  Future<void> update(DocumentFile file) async {
    await colRef.doc(file.fileId).update(file.toFireStore());
  }

  Future<void> delete(String fileId) async {
    await colRef.doc(fileId).delete();
  }

  Future<List<DocumentFile>> getFileByBucketId(String bucketId) async {
    try {
      final snapshot =
          await colRef
              .where('bucketId', isEqualTo: bucketId)
              .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
              .get();
      return snapshot.docs.map((e) => DocumentFile.fromFireStore(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to get files: $e');
    }
  }

  Future<DocumentFile> getFileByFileId(String fileId) async {
    try {
      final snapshot =
          await colRef
              .doc(fileId)
              .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
              .get();

      if (snapshot.data() == null || !snapshot.exists) throw Exception('File not found');
      return snapshot.data()!;
    } catch (e) {
      throw Exception('Failed to get file: $e');
    }
  }

  DocumentFile _fromFirestore(snapshot, _) => DocumentFile.fromFireStore(snapshot.data()!);
  Map<String, Object?> _toFirestore(file, _) => file.toFireStore();
}
