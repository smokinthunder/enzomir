import 'package:enzomir/core/common/presentation/widgets/loader.dart';
import 'package:enzomir/core/utils/show_snackbar.dart';
import 'package:enzomir/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:enzomir/features/auth/presentation/widgets/back_button_widget.dart';
import 'package:enzomir/features/auth/presentation/widgets/login_button.dart';
import 'package:enzomir/features/auth/presentation/widgets/login_form.dart';
import 'package:enzomir/features/auth/presentation/widgets/or_divider.dart';
import 'package:enzomir/features/auth/presentation/widgets/sign_up_text.dart';
import 'package:enzomir/features/auth/presentation/widgets/social_buttons.dart';
import 'package:enzomir/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/auth/login_appbar2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: const BackButtonWidget(),
          ),
          const BottomSection(),
        ],
      ),
    );
  }
}

class BottomSection extends StatefulWidget {
  const BottomSection({super.key});

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Loader();
              }
              if (state is AuthSuccess) {
                // WidgetsBinding.instance.addPostFrameCallback((_) {
                //   context.go(Routes.homePage);
                // });
              }
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 0),
                    WelcomeText(),
                    SizedBox(height: 40),
                    LoginForm(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    SizedBox(height: 60),
                    LoginButton(
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            AuthSignIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    OrDivider(),
                    SizedBox(height: 30),
                    SocialButtons(),
                    SizedBox(height: 10),
                    SignUpText(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
