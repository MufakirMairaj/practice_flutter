import '../../domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final AuthAction action;
  AuthLoading(this.action);
}

class AuthSuccess extends AuthState {
  final UserEntity user;
  AuthSuccess(this.user);
}

class AuthMessage extends AuthState {
  final String message;
  AuthMessage(this.message);
}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}

class AuthEmailInvalid extends AuthState {}

class AuthEmailValid extends AuthState {}

class AuthNameInvalid extends AuthState {}

class AuthNameValid extends AuthState {}

enum AuthAction {
  login,
  register,
  forgotPassword,
  socialLogin,
}
