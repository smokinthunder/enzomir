// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainFailure()';
}


}

/// @nodoc
class $MainFailureCopyWith<$Res>  {
$MainFailureCopyWith(MainFailure _, $Res Function(MainFailure) __);
}


/// @nodoc


class _ClientFailure implements MainFailure {
  const _ClientFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainFailure.clientFailure()';
}


}




/// @nodoc


class _ServerFailure implements MainFailure {
  const _ServerFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainFailure.serverFailure()';
}


}




/// @nodoc


class _AuthFailure implements MainFailure {
  const _AuthFailure(this.authFailure);
  

 final  AuthFailure authFailure;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFailureCopyWith<_AuthFailure> get copyWith => __$AuthFailureCopyWithImpl<_AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFailure&&(identical(other.authFailure, authFailure) || other.authFailure == authFailure));
}


@override
int get hashCode => Object.hash(runtimeType,authFailure);

@override
String toString() {
  return 'MainFailure.authFailure(authFailure: $authFailure)';
}


}

/// @nodoc
abstract mixin class _$AuthFailureCopyWith<$Res> implements $MainFailureCopyWith<$Res> {
  factory _$AuthFailureCopyWith(_AuthFailure value, $Res Function(_AuthFailure) _then) = __$AuthFailureCopyWithImpl;
@useResult
$Res call({
 AuthFailure authFailure
});


$AuthFailureCopyWith<$Res> get authFailure;

}
/// @nodoc
class __$AuthFailureCopyWithImpl<$Res>
    implements _$AuthFailureCopyWith<$Res> {
  __$AuthFailureCopyWithImpl(this._self, this._then);

  final _AuthFailure _self;
  final $Res Function(_AuthFailure) _then;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authFailure = null,}) {
  return _then(_AuthFailure(
null == authFailure ? _self.authFailure : authFailure // ignore: cast_nullable_to_non_nullable
as AuthFailure,
  ));
}

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<$Res> get authFailure {
  
  return $AuthFailureCopyWith<$Res>(_self.authFailure, (value) {
    return _then(_self.copyWith(authFailure: value));
  });
}
}

// dart format on
