part of '../../repositories/organization_repository.dart';

class FirebaseOrganizationApi extends OrganizationApi {
  final db.DatabaseReference orgRef;

  FirebaseOrganizationApi({db.FirebaseDatabase? firestore})
    : orgRef = (firestore ?? db.FirebaseDatabase.instance).ref('organizations');

  @override
  Future<void> create(Organization organization) {
    return handleErrors(
      () => orgRef.child(organization.orgId).set(organization.toJson()),
      'Failed to create organization',
    );
  }

  @override
  Future<void> delete(String orgId) {
    return handleErrors(() => orgRef.child(orgId).remove(), 'Failed to delete organization');
  }

  @override
  Future<Organization> getById(String orgId) async {
    return handleErrors(() async {
      final snapshot = await orgRef.child(orgId).get();
      if (snapshot.value == null) {
        throw Exception('Organization not found');
      }
      return Organization.fromJson(json.decode(json.encode(snapshot.value)));
    }, 'Failed to get organization');
  }

  @override
  Future<void> updateDescription(String orgId, String newDescription) {
    return handleErrors(
      () => orgRef.child(orgId).update({'description': newDescription}),
      'Failed to update organization description',
    );
  }

  @override
  Future<void> updateName(String orgId, String newName) {
    return handleErrors(
      () => orgRef.child(orgId).update({'name': newName}),
      'Failed to update organization name',
    );
  }
}
