import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test_app/models/auth_model.dart';

final signInControllerProvider = Provider((ref) {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  return SignInController(authNotifier);
});

class SignInController {
  final AuthNotifier authNotifier;

  SignInController(this.authNotifier);

  signIn(String email, String password) {
    authNotifier.signIn(email: email, password: password);
  }

  signOut() {
    authNotifier.signOut();
  }
}
