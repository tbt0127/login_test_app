import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test_app/models/auth_model.dart';
import 'package:login_test_app/utils/global_key.dart';

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
    final authNotifier = ref.watch(authNotifierProvider);
    final appUserNotifier = ref.watch(appUserProvider);
    final emailController = ref.watch(_emailTextEditingController);
    final passwordController = ref.watch(_passwordTextEditingController);
    final globalKey = ref.watch(formKeyProvider);

    return Center(
      child: Stack(
        children: [
          appUserNotifier.when(
            data: (data) {
              if (data == null) {
                return Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "emailが不正です";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "パスワードが不正です";
                          } else {
                            return null;
                          }
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            ref.watch(authNotifierProvider.notifier).signIn(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        child: const Text('SignIn'),
                      ),
                      if (authNotifier is AsyncError)
                        Text(authNotifier.stackTrace.toString())
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    Text(data.name),
                    TextButton(
                      onPressed: () {
                        ref.watch(authNotifierProvider.notifier).signOut();
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
          if (authNotifier.isLoading)
            const CircularProgressIndicator(
              semanticsLabel: 'Circular progress indicator',
            ),
        ],
      ),
    );
  }
}
