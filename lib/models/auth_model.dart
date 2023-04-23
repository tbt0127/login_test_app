import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test_app/entities/app_userinfo.dart';
import 'package:login_test_app/repositories/auth_repository.dart';
import 'package:login_test_app/utils/loading_notifier.dart';

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, void>(() {
  return AuthNotifier();
});

final appUserProvider = StreamProvider<AppUserInfo?>(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges().map((user) =>
      user == null
          ? null
          : AppUserInfo(id: user.uid, name: user.email ?? "empty mail")),
);

class AuthNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  /// サインインする
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.watch(authRepositoryProvider);

    // サインイン結果をローディング中にする
    state = const AsyncLoading();

    // サインイン処理を実行する
    state = await AsyncValue.guard(() async {
      await authRepository.signIn(
        email: email,
        password: password,
      );
      return;
    });
  }

  Future<void> signOut() async {
    ref.read(loadingNotifierProvider.notifier).startLoading();
    final authRepository = ref.watch(authRepositoryProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authRepository.signOut();
      return;
    });
    ref.read(loadingNotifierProvider.notifier).finishLoading();
  }
}
