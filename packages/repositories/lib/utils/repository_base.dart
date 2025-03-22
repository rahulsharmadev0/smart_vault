import 'package:repositories/cache/hive_cache.dart';

/// Mixin to provide error handling behavior
mixin ErrorHandlingMixin {
  Future<T> handleErrors<T>(Future<T> Function() operation, [String? errorPrefix]) async {
    try {
      return await operation();
    } catch (e) {
      final prefix = errorPrefix != null ? '$errorPrefix: ' : '';
      print('$prefix${e.toString()}');
      throw Exception('$prefix${e.toString()}');
    }
  }
}

/// Base class for API interfaces in the application
abstract class ApiBase<X> with ErrorHandlingMixin {
  final X? credential;
  const ApiBase([this.credential]);
}

/// Core Repository abstraction
abstract class BaseRepository with ErrorHandlingMixin {
  const BaseRepository();
}

/// Local repository without API dependency
abstract class LocalRepository<T extends Object> extends BaseRepository {
  final T api;
  const LocalRepository(this.api);
}

/// Repository with API dependency only (no in-memory cache or local storage)
abstract class Repository<T extends ApiBase> extends BaseRepository {
  final T api;
  const Repository(this.api);
}

/// Repository with API and cache dependency
abstract class CachedRepository<T extends ApiBase, C extends HiveCache>
    extends BaseRepository {
  final T api;
  final C cache;
  const CachedRepository(this.api, this.cache);
}

/// Repository with API and in-memory cache dependency
abstract class InMemoryCachedRepository<T extends ApiBase, C extends Object>
    extends BaseRepository {
  final T api;
  final C cache;
  const InMemoryCachedRepository(this.api, this.cache);
}
