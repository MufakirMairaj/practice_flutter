import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/features/auth/domain/usecases/login_usecase.dart';
import 'package:practice_flutter/features/auth/domain/usecases/register_usecase.dart'
    show RegisterUseCase, RegisterParams;
import 'package:practice_flutter/features/auth/presentation/bloc/auth_event.dart';
import 'package:practice_flutter/features/auth/presentation/bloc/auth_state.dart';

import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/social_login_usecase.dart' hide LoginParams;

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
  }) : super(AuthInitial()) {

    on<EmailChangedEvent>((event, emit) {
      final isValid = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      ).hasMatch(event.email);

      if (isValid || event.email.isEmpty) {
        emit(AuthEmailValid());
      } else {
        emit(AuthEmailInvalid());
      }

    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading(AuthAction.login));
      final user = await login(LoginParams(event.email, event.password));
      emit(AuthSuccess(user));
    });

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading(AuthAction.register));
      await register(RegisterParams(event.email, event.password, event.name));
      emit(AuthMessage("Reset link sent"));
    });

    on<ForgotPasswordEvent>((event, emit) async {
      emit(AuthLoading(AuthAction.forgotPassword));
      await forgot(ForgetPasswordParams(event.email));
      emit(AuthMessage("Reset link sent"));
    });

  }
}
