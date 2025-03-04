part of 'organization_repository.dart';

class OrganizationFirebaseApi implements OrganizationApi {
  final db.DatabaseReference orgRef;

  OrganizationFirebaseApi({db.FirebaseDatabase? firestore})
    : orgRef = (firestore ?? db.FirebaseDatabase.instance).ref('organizations');

  @override
  Future<void> create(Organization organization) async {
    await orgRef.child(organization.orgId).set(organization.toJson());
  }

  @override
  Future<void> delete(String orgId) async {
    await orgRef.child(orgId).remove();
  }

  @override
  Future<Organization> getById(String orgId) async {
    final snapshot = await orgRef.child(orgId).get();
    return Organization.fromJson(json.decode(json.encode(snapshot.value)));
  }

  @override
  Future<void> updateDescription(String orgId, String newDescription) {
    return orgRef.child(orgId).update({'description': newDescription});
  }

  @override
  Future<void> updateName(String orgId, String newName) {
    return orgRef.child(orgId).update({'name': newName});
  }
}
