import 'package:flutter/foundation.dart';

/// Base class for all API interfaces in the application
abstract class ApiBase {
  @protected
  Future<T> handleErrors<T>(Future<T> Function() operation, [String? errorPrefix]) async {
    try {
      return await operation();
    } catch (e) {
      final prefix = errorPrefix != null ? '$errorPrefix: ' : '';
      throw Exception('$prefix${e.toString()}');
    }
  }
}

/// Base class for all repositories in the application
abstract class RepositoryBase<T extends ApiBase> {
  final T api;

  const RepositoryBase(this.api);
}
