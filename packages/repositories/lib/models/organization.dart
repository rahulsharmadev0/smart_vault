import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:repositories/models/document_type.dart';
import 'package:uuid/uuid.dart';

part 'organization_extension.dart';
part 'document_file.dart';
part 'bucket.dart';

part 'organization.freezed.dart';
part 'organization.g.dart';

//
//===============================================================
//  Organization
//===============================================================
//

@freezed
sealed class Organization with _$Organization {
  @override
  final String orgId;
  @override
  final DateTime createdAt, updatedAt;

  Organization._({String? orgId, DateTime? createdAt, DateTime? updatedAt})
    : orgId = orgId ?? const Uuid().v4(),
      createdAt = createdAt ?? DateTime.now(),
      updatedAt = updatedAt ?? DateTime.now();

  factory Organization({
    String? orgId,
    required String email,
    required String name,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}
