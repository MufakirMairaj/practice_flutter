import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password,String name);
  Future<UserModel> forgotPassword(String email);
  Future<UserModel> socialLogin(String provider);
}
