import 'package:enzomir/core/common/presentation/widgets/loader.dart';
import 'package:enzomir/core/utils/show_snackbar.dart';
import 'package:enzomir/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:enzomir/features/auth/presentation/widgets/back_button_widget.dart';
import 'package:enzomir/features/auth/presentation/widgets/login_button.dart';
import 'package:enzomir/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:enzomir/features/auth/presentation/widgets/sign_up_text.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
  final usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
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
                    Text("Create Account", style: AppTextStyles.loginHeading),
                    SizedBox(height: 40),
                    SignUpForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      usernameController: usernameController,
                    ),
                    SizedBox(height: 60),
                    LoginButton(
                      isSignupButton: true,
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            AuthSignUp(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              name: usernameController.text.trim(),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    SignUpText(isSignup: true),
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
