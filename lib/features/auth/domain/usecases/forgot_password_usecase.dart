import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class ForgotPasswordUseCase extends UseCase<UserEntity, ForgetPasswordParams> {
  final AuthRepository repo;

  ForgotPasswordUseCase(this.repo);

  @override
  Future<UserEntity> call(ForgetPasswordParams params) {
    return repo.forgotPassword(params.email);
  }
}

class ForgetPasswordParams {
  final String email;

  ForgetPasswordParams(this.email);
}
