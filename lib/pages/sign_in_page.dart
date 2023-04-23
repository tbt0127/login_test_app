import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test_app/controllers/sign_in_controller.dart';
import 'package:login_test_app/models/app_user_info_model.dart';

final _emailTextEditingController = Provider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);

final _passwordTextEditingController =
    Provider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider
    final signInController = ref.read(signInControllerProvider);
    final appUserInfoModel = ref.watch(appUserInfoModelProvider);
    final emailController = ref.watch(_emailTextEditingController);
    final passwordController = ref.watch(_passwordTextEditingController);

    return Center(
      child: appUserInfoModel.when(
        data: (data) {
          if (data == null) {
            return Column(
              children: [
                TextField(
                  controller: emailController,
                ),
                TextField(
                  controller: passwordController,
                ),
                ElevatedButton(
                  onPressed: () {
                    signInController.signIn(
                        emailController.text, passwordController.text);
                  },
                  child: const Text('SignIn'),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Text(data.name),
                TextButton(
                  onPressed: () {
                    signInController.signOut();
                  },
                  child: const Text('sign out'),
                )
              ],
            );
          }
        },
        error: (e, s) => Text(e.toString()),
        loading: () => const Text('Loading'),
      ),
    );
  }
}
