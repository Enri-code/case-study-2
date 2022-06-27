import 'package:case_study/application/auth/auth_bloc.dart';
import 'package:case_study/presentation/core/theming/size_config.dart';
import 'package:case_study/presentation/core/theming/strings.dart';
import 'package:case_study/presentation/core/widgets/default_container.dart';
import 'package:case_study/presentation/core/widgets/floating_containers.dart';
import 'package:case_study/presentation/core/widgets/my_behavior.dart';
import 'package:case_study/presentation/core/widgets/notify.dart';
import 'package:case_study/presentation/core/widgets/text_fields.dart';
import 'package:case_study/presentation/home_page.dart';
import 'package:case_study/presentation/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatefulWidget {
  static const route = '/sign_up';
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with TickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1.defaultHeight(),
            child: FloatingContainer(
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(top: .1.defaultHeight()),
                      child: Text(
                        AppStrings.signUp,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 4,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DefaultTextField(
                            controller: emailController,
                            icon: Icons.email_outlined,
                            hintText: AppStrings.email,
                            isPassword: false,
                            isEmail: true),
                        DefaultTextField(
                            controller: passwordController,
                            icon: Icons.lock_outline,
                            hintText: AppStrings.password,
                            isPassword: true,
                            isEmail: false),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if (state.status == AuthStatus.success) {
                                  Navigator.pushNamed(context, HomeView.route,
                                      arguments: emailController.text);
                                } else if (state.status == AuthStatus.failed) {
                                  Notify.error(context, state.error.errMessage);
                                }
                              },
                              builder: (context, state) {
                                return DefaultContainer(
                                    status: state.status,
                                    string: AppStrings.signUp,
                                    width: 2.58,
                                    voidCallback: () {
                                      if (emailController.text.isNotEmpty ||
                                          passwordController.text.isNotEmpty) {
                                        context.read<AuthBloc>().add(
                                            AuthEvent.signUp(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text));
                                      } else {
                                        Notify.error(context,
                                            AppStrings.emptyEmailorPassword);
                                      }
                                    });
                              },
                            ),
                            SizedBox(width: (1.defaultWidth() / 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DefaultContainer(
                            string: AppStrings.loginInToPreviousAccount,
                            width: 2,
                            voidCallback: () {
                              HapticFeedback.lightImpact();
                              Navigator.pushNamed(context, LoginView.route);
                            }),
                        SizedBox(height: .05.defaultHeight()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
