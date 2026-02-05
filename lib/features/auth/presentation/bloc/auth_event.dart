import 'package:equatable/equatable.dart';



abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LoginInputChanged extends AuthEvent {
  final String email;
  final String password;

  const LoginInputChanged(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const RegisterEvent(this.email, this.password, this.name);

  @override
  List<Object?> get props => [email, password, name];
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  const ForgotPasswordEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class SocialLoginEvent extends AuthEvent {
  final String provider;
  const SocialLoginEvent(this.provider);

  @override
  List<Object?> get props => [provider];
}

class EmailChangedEvent extends AuthEvent {
  final String email;
  const EmailChangedEvent(this.email);

  @override
  List<Object?> get props => [email];
}
