import 'dart:async';

import 'package:flutter/foundation.dart';

class StreamToListenable<T> extends ChangeNotifier {
  StreamToListenable(Stream<T> stream) {
    notifyListeners();
    _subscription = stream.listen((T _) => notifyListeners());
  }

  late final StreamSubscription<T> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
