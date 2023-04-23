import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadingNotifierProvider =
    AutoDisposeNotifierProvider<LoadingNotifier, bool>(() {
  return LoadingNotifier();
});

class LoadingNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return false;
  }

  void startLoading() {
    state = true;
  }

  void finishLoading() {
    state = false;
  }
}
