import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:enzomir/domain/user/i_user_repo.dart';
import 'package:enzomir/domain/user/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IUserRepo _userRepo;

  AuthBloc(this._userRepo) : super(AuthState.initial()) {
    on<_SignInWithGoogle>(_onSignInWithGoogle);
    on<_SignOut>(_onSignOut);
    on<_GetUser>(_onGetUser);
  }

  void _onSignInWithGoogle(AuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(islogging: true));
    final user = await _userRepo.signInWithGoogle();
    user.fold(
      (l) => emit(state.copyWith(islogging: false, islogged: false)),
      (r) => emit(state.copyWith(user: r, islogging: false, islogged: true)),
    );
  }

  void _onSignOut(AuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(islogging: true));
    final user = await _userRepo.signOut();
    user.fold(
      (l) => emit(state.copyWith(islogging: false, islogged: false)),
      (r) => emit(state.copyWith(user: r, islogging: false, islogged: false)),
    );
  }

  void _onGetUser(AuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(islogging: true));
    final user = await _userRepo.getUser();
    // user.fold(
    //   (l) => emit(state.copyWith(islogging: false, islogged: false)),
    //   (r) => emit(state.copyWith(user: r, islogging: false, islogged: true)),
    // );
    emit(
      user.fold(
        (l){
          return const AuthState(islogging: false, islogged: false, user: UserModel(uid: '', email: '', name: ''));

        },
        (r){
          return AuthState(islogging: false, islogged: true, user: r);
        }
      )
    );
  }
}