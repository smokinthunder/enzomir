part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
const factory AuthState({
  required UserModel user,
  required bool islogging,
  required bool islogged,
}) = _AuthState;

factory AuthState.initial() => const AuthState(
  user: UserModel(uid: '', email: '', name: ''),
  islogging: false,
  islogged: false,
);

  @override
  // TODO: implement islogged
  bool get islogged => throw UnimplementedError();

  @override
  // TODO: implement islogging
  bool get islogging => throw UnimplementedError();

  @override
  // TODO: implement user
  UserModel get user => throw UnimplementedError();
}