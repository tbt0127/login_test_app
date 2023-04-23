import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test_app/entities/app_userinfo.dart';
import 'package:login_test_app/repositories/auth_repository_impl.dart';

final appUserInfoModelProvider =
    AsyncNotifierProvider<AppUserInfoModelNotifier, AppUserInfo?>(() {
  return AppUserInfoModelNotifier();
});

class AppUserInfoModelNotifier extends AsyncNotifier<AppUserInfo?> {
  @override
  FutureOr<AppUserInfo?> build() {
    ref.listen(authUserProvider, (previous, next) {
      next.when(data: (data) {
        debugPrint("data: ${data?.uid ?? "null"}");
        if (data != null) {
          debugPrint("data: ${data.uid}");
          state = AsyncValue.data(
              AppUserInfo(id: data.uid, name: data.email ?? "empty"));
        } else {
          debugPrint("null");
          state = const AsyncValue.data(null);
        }
      }, error: (error, stackTrace) {
        debugPrint("error");
        state = AsyncValue.error(error, stackTrace);
      }, loading: () {
        debugPrint("loading");
        state = const AsyncLoading();
      });
    });
    return null;
  }

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
      return null;
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
