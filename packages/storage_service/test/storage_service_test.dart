import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storage_service/storage_service.dart';

void main() {
  group('StorageService', () {
    test('creates instance correctly', () {
      final service = StorageService();
      expect(service, isA<StorageService>());
      expect(service.uploadTasks, isA<ValueNotifier>());
    });
  });

  group('Utils', () {
    test('returns correct content type for extensions', () {
      expect(getMimeType('pdf'), 'application/pdf');
      expect(getMimeType('doc'), 'application/msword');
      expect(getMimeType('txt'), 'text/plain');
      expect(getMimeType('unknown'), 'application/octet-stream');
    });
  });
}
