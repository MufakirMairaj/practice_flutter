import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SocialLoginUseCase extends UseCase<UserEntity, LoginParams> {
  final AuthRepository repo;

  SocialLoginUseCase(this.repo);

  @override
  Future<UserEntity> call(LoginParams params) {
    return repo.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);
}
