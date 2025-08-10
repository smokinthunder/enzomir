import 'dart:async';
import 'package:enzomir/core/common/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:enzomir/core/usecase/usecase.dart';
import 'package:enzomir/core/common/domain/entities/user.dart';
import 'package:enzomir/features/auth/domain/usecases/current_user.dart';
import 'package:enzomir/features/auth/domain/usecases/user_sign_in.dart';
import 'package:enzomir/features/auth/domain/usecases/user_sign_up.dart';
import 'package:enzomir/features/auth/domain/usecases/user_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final CurrentUser _currentUser;
  final UserLogout _userLogout;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required CurrentUser currentUser,
    required UserLogout userLogout,
    required AppUserCubit appUserCubit,
  }) : _userSignUp = userSignUp,
       _userSignIn = userSignIn,
       _currentUser = currentUser,
       _userLogout = userLogout,
       _appUserCubit = appUserCubit,
       super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_authSignUp);
    on<AuthSignIn>(_authSignIn);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
    on<AuthLogOut>(_authLogOut);
  }

  void _authSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final res = await _userSignUp(
      UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );
    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _authSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    final res = await _userSignIn(
      UserSignInParams(email: event.email, password: event.password),
    );
    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  Future<void> _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());
    res.fold((l) => emit(AuthFailure(l.message)), (r) {
      print(r.email);
      _emitAuthSuccess(r, emit);
      print("User is logged in: ${r.email}");
    });
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    print("AppUserSate updated with user: ${user.email}");
    emit(AuthSuccess(user));
    print("AuthSuccess emitted with user: ${user.name}");
  }

  Future<void> _authLogOut(AuthLogOut event, Emitter<AuthState> emit) async {
    final res = await _userLogout(NoParams());
    res.fold((l) => emit(AuthFailure(l.message)), (r) {
      _appUserCubit.updateUser(null);
      emit(AuthInitial());
    });
  }
}
