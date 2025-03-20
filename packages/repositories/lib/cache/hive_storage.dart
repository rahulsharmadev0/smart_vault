import 'dart:async';
import 'package:hive_ce/hive.dart';
import 'package:meta/meta.dart';
// ignore: implementation_imports
import 'package:hive_ce/src/hive_impl.dart';
import '_migration/_migration_stub.dart'
    if (dart.library.io) '/_migration/_migration_io.dart';
import 'package:synchronized/synchronized.dart';

/// Interface which is used to persist and retrieve state changes.
abstract class Storage {
  /// Returns value for key
  dynamic read(String key);

  /// Persists key value pair
  Future<void> write(String key, dynamic value);

  /// Deletes key value pair
  Future<void> delete(String key);

  /// Clears all key value pairs from storage
  Future<void> clear();

  /// Clears all key value pairs from storage
  Future<void> close();

  bool containsKey(String key);

  /// Flushes all pending changes of the box to disk.
  Future<void> flush();

  /// Stream of keys that have changed
  Stream<BoxEvent> watch(String key);
}

class StorageNotFound implements Exception {
  /// {@macro storage_not_found}
  const StorageNotFound();

  @override
  String toString() {
    return 'Storage was accessed before it was initialized.\n'
        'Please ensure that storage has been initialized.\n\n'
        'For example:\n\n'
        'HiveStorage.storage = await HiveStorage.build();';
  }
}

/// {@template hydrated_storage_directory}
/// A platform-agnostic storage directory representation.
/// {@endtemplate}
class HiveStorageDirectory {
  /// {@macro hydrated_storage_directory}
  const HiveStorageDirectory(this.path);

  /// The path to the storage directory.
  final String path;

  /// Sentinel directory used to determine that web storage should be used
  /// when initializing [HiveStorage].
  ///
  /// ```dart
  /// await HiveStorage.build(
  ///   storageDirectory: HiveStorageDirectory.web,
  /// );
  /// ```
  static const web = HiveStorageDirectory('');
}

/// {@template hydrated_storage}
/// Implementation of [Storage] which uses [package:hive_ce](https://pub.dev/packages/hive_ce)
/// to persist and retrieve state changes from the local device.
/// {@endtemplate}
class HiveStorage implements Storage {
  // ignore: unused_element
  HiveStorage._(this._box);

  static HiveStorage? _instance;

  static set instance(HiveStorage storage) {
    _instance = storage;
  }

  static HiveStorage get instance {
    if (_instance == null) throw const StorageNotFound();
    return _instance!;
  }

  /// {@macro hydrated_storage}
  @visibleForTesting
  HiveStorage(this._box);

  /// Returns an instance of [HiveStorage].
  /// [storageDirectory] is required.
  ///
  /// For web, use [HiveStorageDirectory.web] as the `storageDirectory`
  ///
  /// ```dart
  /// import 'package:flutter/foundation.dart';
  /// import 'package:flutter/material.dart';
  ///
  /// import 'package:hydrated_bloc/hydrated_bloc.dart';
  /// import 'package:path_provider/path_provider.dart';
  ///
  /// Future<void> main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   HydratedBloc.storage = await HiveStorage.build(
  ///     storageDirectory: kIsWeb
  ///         ? HiveStorageDirectory.web
  ///         : HiveStorageDirectory((await getTemporaryDirectory()).path),
  ///   );
  ///   runApp(App());
  /// }
  /// ```
  ///
  /// With [encryptionCipher] you can provide custom encryption.
  /// Following snippet shows how to make default one:
  /// ```dart
  /// import 'package:crypto/crypto.dart';
  /// import 'package:hydrated_bloc/hydrated_bloc.dart';
  ///
  /// const password = 'hydration';
  /// final byteskey = sha256.convert(utf8.encode(password)).bytes;
  /// return HydratedAesCipher(byteskey);
  /// ```
  static Future<HiveStorage> build({
    required HiveStorageDirectory storageDirectory,
    HiveCipher? encryptionCipher,
  }) {
    return _lock.synchronized(() async {
      // Use HiveImpl directly to avoid conflicts with existing Hive.init
      // https://github.com/hivedb/hive/issues/336
      hive = HiveImpl();
      Box<dynamic> box;

      if (storageDirectory == HiveStorageDirectory.web) {
        box = await hive.openBox<dynamic>('hive_box', encryptionCipher: encryptionCipher);
      } else {
        hive.init(storageDirectory.path);
        box = await hive.openBox<dynamic>('hive_box', encryptionCipher: encryptionCipher);
        await migrate(storageDirectory.path, box);
      }

      return HiveStorage(box);
    });
  }

  /// Internal instance of [HiveImpl].
  /// It should only be used for testing.
  @visibleForTesting
  static late HiveInterface hive;

  static final _lock = Lock();

  final Box<dynamic> _box;

  @override
  Stream<BoxEvent> watch(String key) => _box.watch(key: key);

  @override
  bool containsKey(String key) => _box.containsKey(key);

  @override
  Future<void> flush() async {
    if (_box.isOpen) {
      return _lock.synchronized(() => _box.flush());
    }
  }

  @override
  dynamic read(String key) => _box.isOpen ? _box.get(key) : null;

  @override
  Future<void> write(String key, dynamic value) async {
    if (_box.isOpen) {
      return _lock.synchronized(() => _box.put(key, value));
    }
  }

  @override
  Future<void> delete(String key) async {
    if (_box.isOpen) {
      return _lock.synchronized(() => _box.delete(key));
    }
  }

  @override
  Future<void> clear() async {
    if (_box.isOpen) {
      return _lock.synchronized(_box.clear);
    }
  }

  @override
  Future<void> close() async {
    if (_box.isOpen) {
      return _lock.synchronized(_box.close);
    }
  }
}
