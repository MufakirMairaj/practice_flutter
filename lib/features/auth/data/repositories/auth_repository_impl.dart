import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<UserEntity> login(String email, String password) {
    return remote.login(email, password);
  }

  @override
  Future<UserEntity> register(String name, String email, String password) {
    return remote.register(email, password,name);
  }

  @override
  Future<UserEntity> forgotPassword(String email) {
    return remote.forgotPassword(email);
  }

  @override
  Future<UserEntity> socialLogin(String provider) {
    return remote.socialLogin(provider);
  }
}
