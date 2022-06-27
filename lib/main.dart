import 'package:authentication_infrastruture/infrastruture.dart';
import 'package:authentication_use_case/usecases.dart';
import 'package:case_study/application/auth/auth_bloc.dart';
import 'package:case_study/presentation/core/theming/size_config.dart';
import 'package:case_study/presentation/home_page.dart';
import 'package:case_study/presentation/login.dart';
import 'package:case_study/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utils/utils.dart';

void main() async {
  await _appInitializer();
}

Future<void> _appInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          AuthUseCase(repo: AuthenticationRepoImpl(DioClient())),
      child: BlocProvider(
        create: (context) => AuthBloc(repo: context.read<AuthUseCase>()),
        child: MaterialApp(
          title: 'Case Study',
          debugShowCheckedModeBanner: false,
          routes: {
            LoginView.route: (_) => const LoginView(),
            SignUpView.route: (_) => const SignUpView(),
            HomeView.route: (_) => const HomeView()
          },
          home: const Responsive(child: LoginView()),
        ),
      ),
    );
  }
}
