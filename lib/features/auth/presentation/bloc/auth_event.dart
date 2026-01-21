abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email, password;
  LoginEvent(this.email, this.password);
}

class RegisterEvent extends AuthEvent {
  final String email, password,name;
  RegisterEvent(this.email, this.password,this.name);
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  ForgotPasswordEvent(this.email);
}

class SocialLoginEvent extends AuthEvent {
  final String provider;
  SocialLoginEvent(this.provider);
}


class EmailChangedEvent extends AuthEvent {
  final String email;
  EmailChangedEvent(this.email);
}