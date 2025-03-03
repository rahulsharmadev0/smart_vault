
part of 'bucket_repository.dart';

class BucketFirebaseApi implements BucketApi {
  final db.DatabaseReference orgRef;
  static const _path = 'buckets';

  BucketFirebaseApi({db.FirebaseDatabase? firestore})
    : orgRef = (firestore ?? db.FirebaseDatabase.instance).ref('organizations');

  @override
  Future<void> create(String orgId, Bucket bucket) async {
    await orgRef.child("$orgId/$_path/${bucket.bucketId}").set(bucket.toJson());
  }

  @override
  Future<void> update(String orgId, Bucket bucket) async {
    await orgRef.child("$orgId/$_path/${bucket.bucketId}").update(bucket.toJson());
  }

  @override
  Future<void> delete(String orgId, String bucketId) async {
    await orgRef.child("$orgId/$_path/$bucketId").remove();
  }

  @override
  Future<Bucket> getBucket(String orgId, String bucketId) async {
    final snapshot = await orgRef.child("$orgId/$_path/$bucketId").get();
    return Bucket.fromJson(snapshot.value! as Map<String, dynamic>);
  }

  @override
  Future<List<Bucket>> getBucketsByOrgId(String orgId) async {
    final snapshot = await orgRef.child("$orgId/$_path").get();
    return snapshot.children.map((e) => Bucket.fromJson(e.value as Map<String, dynamic>)).toList();
  }
}
