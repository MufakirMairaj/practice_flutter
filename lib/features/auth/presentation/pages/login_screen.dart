import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(title: const Text("Login")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        builder: (context, state) {
          final isLoading =
              state is AuthLoading &&
                  state.action == AuthAction.login;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Column(
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (prev, curr) =>
                      curr is AuthEmailValid ||
                          curr is AuthEmailInvalid,
                      builder: (context, state) {
                        return TextField(
                          controller: emailController,
                          onChanged: (value) {
                            context
                                .read<AuthBloc>()
                                .add(EmailChangedEvent(value));
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            errorText: state is AuthEmailInvalid
                                ? "Invalid email format"
                                : null,
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration:
                      const InputDecoration(labelText: "Password"),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                          context.read<AuthBloc>().add(
                            LoginEvent(
                              emailController.text.trim(),
                              passwordController.text,
                            ),
                          );
                        },
                        child: const Text("Login"),
                      ),
                    ),
                  ],
                ),

                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

}

