import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(String name, String email, String password);
  Future<UserEntity> forgotPassword(String email);
  Future<UserEntity> socialLogin(String provider);
}
