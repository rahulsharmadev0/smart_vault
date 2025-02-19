import 'package:firebase_database/firebase_database.dart' as db;
import '../../models/organization.dart';

class OrganizationRepository {
  final db.DatabaseReference orgRef;

  OrganizationRepository({
    db.FirebaseDatabase? firestore,
  }) : orgRef = (firestore ?? db.FirebaseDatabase.instance).ref('organizations');

  Future<void> create(Organization organization) async {
    await orgRef.child(organization.orgId).set(organization.toJson());
  }

  Future<void> update(Organization organization) async {
    await orgRef.child(organization.orgId).update(organization.toJson());
  }

  Future<void> delete(String orgId) async {
    await orgRef.child(orgId).remove();
  }

  Future<Organization> get(String orgId) async {
    final snapshot = await orgRef.child(orgId).get();
    return Organization.fromJson(snapshot.value! as Map<String, dynamic>);
  }
}
