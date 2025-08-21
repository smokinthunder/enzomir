import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:enzomir/domain/core/failures/main_failure.dart';
import 'package:enzomir/domain/user/i_user_repo.dart';
import 'package:enzomir/domain/user/models/user_model.dart';

@LazySingleton(as: IUserRepo)
class UserRepo implements IUserRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<Either<MainFailure, UserModel>> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        return Left(MainFailure.serverFailure());
      } else {
        final googleAuth = await user.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        return Right(
          UserModel(
            uid: FirebaseAuth.instance.currentUser!.uid,
            email: FirebaseAuth.instance.currentUser!.email!,
            name: FirebaseAuth.instance.currentUser!.displayName!,
          ),
        );
      }
    } catch (_) {
      return Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, UserModel>> signOut() async {
    try {
      await _googleSignIn.disconnect();
      await _firebaseAuth.signOut();
      return const Right(UserModel(uid: '', email: '', name: ''));
    } catch (_) {
      return Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, UserModel>> getUser() async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return Left(MainFailure.serverFailure());
      } else {
        return Right(
          UserModel(
            uid: FirebaseAuth.instance.currentUser!.uid,
            email: FirebaseAuth.instance.currentUser!.email!,
            name: FirebaseAuth.instance.currentUser!.displayName!,
          ),
        );
      }
    } catch (_) {
      return Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, UserModel>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateDisplayName(name);

      return Right(
        UserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: name,
        ),
      );
    } catch (_) {
      return Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, UserModel>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(
        UserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: userCredential.user!.displayName ?? '',
        ),
      );
    } catch (_) {
      return Left(MainFailure.clientFailure());
    }
  }
}
