import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/features/auth/domain/usecases/register_usecase.dart'
    show RegisterUseCase, RegisterParams;
import 'package:practice_flutter/features/auth/presentation/bloc/auth_event.dart';
import 'package:practice_flutter/features/auth/presentation/bloc/auth_state.dart';

import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/social_login_usecase.dart' hide LoginParams;
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase login;
  final RegisterUseCase register;
  final ForgotPasswordUseCase forgot;
  final SocialLoginUseCase social;

  AuthBloc({
    required this.login,
    required this.register,
    required this.forgot,
    required this.social,
  }) : super(const AuthInitial()) {
    // Email input validation
    on<LoginInputChanged>((event, emit) {
      final isEnabled =
          event.email.trim().isNotEmpty && event.password.trim().isNotEmpty;

      emit(AuthFormState(isButtonEnabled: isEnabled));
    });

    // Login
    on<LoginEvent>((event, emit) async {
      if (event.email.trim().isEmpty || event.password.trim().isEmpty) {
        emit(const AuthError("Email or password cannot be empty", AuthAction.login));
        return;
      }

      emit(const AuthLoading(AuthAction.login));
      try {
        final user = await login(LoginParams(event.email, event.password));
        emit(AuthSuccess(user, AuthAction.login));
      } catch (e) {
        emit(AuthError(e.toString(), AuthAction.login));
      }
    });

    // Register
    on<RegisterEvent>((event, emit) async {
      emit(const AuthLoading(AuthAction.register));
      try {
        await register(RegisterParams(event.email, event.password, event.name));
        emit(const AuthMessage("Registration successful"));
      } catch (e) {
        emit(AuthError(e.toString(), AuthAction.register));
      }
    });

    // Forgot password
    on<ForgotPasswordEvent>((event, emit) async {
      emit(const AuthLoading(AuthAction.forgotPassword));
      try {
        await forgot(ForgetPasswordParams(event.email));
        emit(const AuthMessage("Reset link sent"));
      } catch (e) {
        emit(AuthError(e.toString(), AuthAction.forgotPassword));
      }
    });

    // Social login
    on<SocialLoginEvent>((event, emit) async {
      emit(const AuthLoading(AuthAction.socialLogin));
      // try {
      //   await social(event.provider);
      //   emit(const AuthMessage("Social login successful"));
      // } catch (e) {
      //   emit(AuthError(e.toString(), AuthAction.socialLogin));
      // }
    });
  }
}

