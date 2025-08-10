import 'package:enzomir/core/common/domain/entities/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(User? user) {
    if (user == null) {
      emit(AppUserInitial());
      print("User is null, emitting AppUserInitial state");
    } else {
      emit(AppUserLoggedIn(user));
      print("User is not null, emitting AppUserLoggedIn state with user: ${user.email} with name: ${user.name}");
    }
  }
}
