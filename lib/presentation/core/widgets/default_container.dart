import 'dart:ui';

import 'package:case_study/application/auth/auth_bloc.dart';
import 'package:case_study/presentation/core/theming/size_config.dart';
import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({
    Key? key,
    required this.string,
    required this.width,
    this.status,
    required this.voidCallback,
  }) : super(key: key);

  final String string;
  final double width;
  final AuthStatus? status;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: 200.h(),
            width: 1.defaultWidth() / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: (status == AuthStatus.loading)
                ? const CircularProgressIndicator()
                : Text(
                    string,
                    style: TextStyle(color: Colors.white.withOpacity(.8)),
                  ),
          ),
        ),
      ),
    );
  }
}
