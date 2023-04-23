import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test_app/entities/app_userinfo.dart';
import 'package:login_test_app/repositories/auth_repository_impl.dart';

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, void>(() {
  return AuthNotifier();
});

final appUserProvider = StreamProvider<AppUserInfo?>(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges().map((user) =>
      AppUserInfo(
          id: user?.uid ?? "empty id", name: user?.email ?? "empty mail")),
);

class AuthNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  /// サインインする
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.watch(authRepositoryImplProvider);
    // サインイン結果をローディング中にする
    state = const AsyncLoading();

    // サインイン処理を実行する
    state = await AsyncValue.guard(() async {
      try {
        await authRepository.signIn(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        debugPrint(e.code);
      }
    });
  }

  Future<void> signOut() async {
    final authRepository = ref.watch(authRepositoryImplProvider);
    // サインイン結果をローディング中にする
    state = const AsyncLoading();

    // サインイン処理を実行する
    state = await AsyncValue.guard(() async {
      try {
        await authRepository.signOut();
      } on FirebaseAuthException catch (e) {
        debugPrint(e.code);
      }
    });
  }
}
