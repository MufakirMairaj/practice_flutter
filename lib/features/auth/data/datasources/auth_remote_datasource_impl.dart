import '../models/user_model.dart';
import 'auth_remote_datasource.dart';



class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(id: '1', email: email, name: 'User');
  }

  @override
  Future<UserModel> register(String email, String password,String name) async {
    return UserModel(id: '2', email: email, name: 'New User');
  }

  @override
  Future<UserModel> forgotPassword(String email) async {
    return   UserModel(id: '2', email: email, name: 'New User');
  }

  @override
  Future<UserModel> socialLogin(String provider) async {
    return UserModel(id: '3', email: 'social@mail.com', name: provider);
  }
}
