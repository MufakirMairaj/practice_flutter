import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase extends UseCase<UserEntity, RegisterParams> {
  final AuthRepository repo;

  RegisterUseCase(this.repo);

  @override
  Future<UserEntity> call(RegisterParams params) {
    return repo.register(params.name, params.email, params.password);
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;

  RegisterParams(this.email, this.password, this.name);
}
