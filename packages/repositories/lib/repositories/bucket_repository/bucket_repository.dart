import 'package:firebase_database/firebase_database.dart' as db;
import 'package:repositories/models.dart';

class BucketRepository {
  final db.DatabaseReference orgRef;

  BucketRepository({
    db.FirebaseDatabase? firestore,
  }) : orgRef = (firestore ?? db.FirebaseDatabase.instance).ref('organizations');
  static const _path = 'buckets';

  Future<void> create(String orgId, Bucket bucket) async {
    await orgRef.child("$orgId/$_path/${bucket.bucketId}").set(bucket.toJson());
  }

  Future<void> update(String orgId, Bucket bucket) async {
    await orgRef.child("$orgId/$_path/${bucket.bucketId}").update(bucket.toJson());
  }

  Future<void> delete(String orgId, String bucketId) async {
    await orgRef.child("$orgId/$_path/$bucketId").remove();
  }

  Future<Bucket> getBucket(String orgId, String bucketId) async {
    final snapshot = await orgRef.child("$orgId/$_path/$bucketId").get();
    return Bucket.fromJson(snapshot.value! as Map<String, dynamic>);
  }

  Future<List<Bucket>> getBucketsByOrgId(String orgId) async {
    final snapshot = await orgRef.child("$orgId/$_path").get();
    return snapshot.children.map((e) => Bucket.fromJson(e.value as Map<String, dynamic>)).toList();
  }
}
