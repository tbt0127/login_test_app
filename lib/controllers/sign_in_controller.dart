import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_test_app/models/app_user_info_model.dart';

final signInControllerProvider = Provider((ref) {
  final appUserInfoModel = ref.read(appUserInfoModelProvider.notifier);
  return SignInController(appUserInfoModel);
});

class SignInController {
  final AppUserInfoModelNotifier appUserInfoModel;

  SignInController(this.appUserInfoModel);

  signIn(String email, String password) {
    appUserInfoModel.signIn(email: email, password: password);
  }

  signOut() {
    appUserInfoModel.signOut();
  }
}
