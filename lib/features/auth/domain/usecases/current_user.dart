import 'package:enzomir/core/error/failures.dart';
import 'package:enzomir/core/usecase/usecase.dart';
import 'package:enzomir/core/common/domain/entities/user.dart';
import 'package:enzomir/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
