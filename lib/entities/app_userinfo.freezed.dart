// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_userinfo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppUserInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppUserInfoCopyWith<AppUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserInfoCopyWith<$Res> {
  factory $AppUserInfoCopyWith(
          AppUserInfo value, $Res Function(AppUserInfo) then) =
      _$AppUserInfoCopyWithImpl<$Res, AppUserInfo>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$AppUserInfoCopyWithImpl<$Res, $Val extends AppUserInfo>
    implements $AppUserInfoCopyWith<$Res> {
  _$AppUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserInfoCopyWith<$Res>
    implements $AppUserInfoCopyWith<$Res> {
  factory _$$_AppUserInfoCopyWith(
          _$_AppUserInfo value, $Res Function(_$_AppUserInfo) then) =
      __$$_AppUserInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$_AppUserInfoCopyWithImpl<$Res>
    extends _$AppUserInfoCopyWithImpl<$Res, _$_AppUserInfo>
    implements _$$_AppUserInfoCopyWith<$Res> {
  __$$_AppUserInfoCopyWithImpl(
      _$_AppUserInfo _value, $Res Function(_$_AppUserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_AppUserInfo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppUserInfo implements _AppUserInfo {
  _$_AppUserInfo({required this.id, required this.name});

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'AppUserInfo(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUserInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserInfoCopyWith<_$_AppUserInfo> get copyWith =>
      __$$_AppUserInfoCopyWithImpl<_$_AppUserInfo>(this, _$identity);
}

abstract class _AppUserInfo implements AppUserInfo {
  factory _AppUserInfo({required final String id, required final String name}) =
      _$_AppUserInfo;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserInfoCopyWith<_$_AppUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
