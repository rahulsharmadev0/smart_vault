import 'package:flutter/foundation.dart';

import 'hive_storage.dart';

abstract class HiveCache<Data> {
  final _storage = HiveStorage.instance;

  Data _cache;

  Data get cache => _cache;
  set cache(Data cache) => _emit(cache);

  HiveCache(Data inital) : _cache = inital {
    try {
      var cacheJson = (_storage.read(storageToken) as Map?)?.cast<String, dynamic>();
      if (cacheJson != null) {
        _cache = fromJson(cacheJson);
      } else {
        _cache = inital;
        _storage.write(storageToken, toJson(inital));
      }
    } catch (error, stackTrace) {
      _cache = inital;
      if (kDebugMode) print('error: $error\n stackTrace: $stackTrace');
    }
  }

  void _emit(Data cache) {
    final oldData = _cache;
    _cache = cache;
    _storage.write(storageToken, toJson(cache)).catchError((error, stackTrace) {
      _cache = oldData;
      if (kDebugMode) print('Error: $error\nStackTrace: $stackTrace');
    });
  }

  Stream<Data> get cacheStream => _storage
      .watch(storageToken)
      .map((event) => event.deleted ? fromJson({}) : fromJson(Map.of(event.value)));

  /// [id] is used to uniquely identify multiple instances
  /// of the same [HiveCache] type.
  /// In most cases it is not necessary;
  /// however, if you wish to intentionally have multiple instances
  /// of the same [HiveCache], then you must override [id]
  /// and return a unique identifier for each [HiveCache] instance
  /// in order to keep the caches independent of each other.
  String get id => '';

  /// Storage prefix which can be overridden to provide a custom
  /// storage namespace.
  /// Defaults to [runtimeType] but should be overridden in cases
  /// where stored data should be resilient to obfuscation or persist
  /// between debug/release builds.
  String get storagePrefix => runtimeType.toString();

  /// `storageToken` is used as registration token for hydrated storage.
  /// Composed of [storagePrefix] and [id].
  String get storageToken => '$storagePrefix$id';

  /// [deleteCache] is used to wipe or invalidate the cache of a [HiveCache].
  /// Calling [deleteCache] will delete the cached cache of the bloc
  /// but will not modify the current cache of the bloc.
  Future<void> deleteCache() => _storage.delete(storageToken);

  /// Responsible for converting the `Map<String, dynamic>` representation
  /// of the bloc cache into a concrete instance of the bloc cache.
  Data fromJson(Map<String, dynamic> json);

  /// Responsible for converting a concrete instance of the bloc cache
  /// into the the `Map<String, dynamic>` representation.
  ///
  /// If [toJson] returns `null`, then no cache changes will be persisted.
  Map<String, dynamic> toJson(Data cache);
}
