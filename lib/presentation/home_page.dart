import 'package:case_study/presentation/core/theming/strings.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const route = '/Home';
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
        body: Center(
      child: Text(AppStrings.welcome + ' ' + email,
          style: const TextStyle(fontSize: 30)),
    ));
  }
}
