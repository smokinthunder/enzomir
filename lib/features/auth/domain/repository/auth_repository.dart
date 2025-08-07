import 'package:enzomir/core/error/failures.dart';
import 'package:enzomir/core/common/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });
  Future<Either<Failure, User>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> currentUser();
  Future<Either<Failure,void>> logOut();
}
