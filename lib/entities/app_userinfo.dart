import 'package:freezed_annotation/freezed_annotation.dart';

// import
part 'app_userinfo.freezed.dart';

@freezed
class AppUserInfo with _$AppUserInfo {
  // IDとユーザ名を持つ
  factory AppUserInfo({
    required String id,
    required String name,
  }) = _AppUserInfo;
}
