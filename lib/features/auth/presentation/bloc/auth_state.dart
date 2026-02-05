import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  final AuthAction action;
  const AuthLoading(this.action);

  @override
  List<Object?> get props => [action];
}

class AuthSuccess extends AuthState {
  final UserEntity user;
  final AuthAction action;
  const AuthSuccess(this.user, this.action);

  @override
  List<Object?> get props => [user, action];
}

class AuthMessage extends AuthState {
  final String message;
  const AuthMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthError extends AuthState {
  final String error;
  final AuthAction action;
  const AuthError(this.error, this.action);

  @override
  List<Object?> get props => [error, action];
}

class AuthEmailInvalid extends AuthState {
  const AuthEmailInvalid();
}

class AuthEmailValid extends AuthState {
  const AuthEmailValid();
}

class AuthNameInvalid extends AuthState {
  const AuthNameInvalid();
}

class AuthNameValid extends AuthState {
  const AuthNameValid();
}

class AuthFormState extends AuthState {
  final bool isButtonEnabled;

  const AuthFormState({required this.isButtonEnabled});

  @override
  List<Object?> get props => [isButtonEnabled];
}

enum AuthAction { login, register, forgotPassword, socialLogin }
