import 'package:dartz/dartz.dart';
import 'package:enzomir/domain/user/models/user_model.dart';
import 'package:enzomir/domain/core/failures/main_failure.dart';

abstract class IUserRepo {
  Future<Either<MainFailure, UserModel>> signInWithGoogle();
  Future<Either<MainFailure, UserModel>> signInWithEmailAndPassword(String email, String password);
  Future<Either<MainFailure, UserModel>> signUpWithEmailAndPassword(String email, String password, String name);
  Future<Either<MainFailure, UserModel>> signOut();
  Future<Either<MainFailure, UserModel>> getUser();
}