import 'dart:async';

import 'package:case_study/presentation/core/theming/size_config.dart';
import 'package:case_study/presentation/core/widgets/custom_painter.dart';
import 'package:flutter/material.dart';

class FloatingContainer extends StatefulWidget {
  const FloatingContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<FloatingContainer> createState() => _FloatingContainerState();
}

class _FloatingContainerState extends State<FloatingContainer>
    with TickerProviderStateMixin {
  late AnimationController sizeController, directionController;
  late Animation<double> topRightAnimation,
      centerLeftAnimation,
      centerRightAnimation,
      bottomLeftAnimation;

  @override
  void initState() {
    super.initState();
    _topRightCircle();
    _centerLeftCircle();
    centerRightCircle();
    bottomLeftAnimation = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: directionController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      sizeController.forward();
    });

    directionController.forward();
  }

  @override
  void dispose() {
    sizeController.dispose();
    directionController.dispose();
    super.dispose();
  }

  _centerLeftCircle() {
    centerLeftAnimation = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: sizeController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    directionController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
  }

  _topRightCircle() {
    sizeController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    topRightAnimation = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: sizeController,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          sizeController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          sizeController.forward();
        }
      });
  }

  centerRightCircle() {
    centerRightAnimation =
        Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: directionController,
      curve: Curves.easeInOut,
    ))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              directionController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              directionController.forward();
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: (9).defaultHeight(),
          left: .21.defaultWidth(),
          child: CustomPaint(
            painter: MyPainter(50.h()),
          ),
        ),
        Positioned(
          top: .98.defaultHeight(),
          left: .1.defaultWidth(),
          child: CustomPaint(
            painter: MyPainter(bottomLeftAnimation.value - 30.h()),
          ),
        ),
        Positioned(
          top: .5.defaultHeight(),
          left: (centerLeftAnimation.value + .8).defaultWidth(),
          child: CustomPaint(
            painter: MyPainter(30.h()),
          ),
        ),
        Positioned(
          top: centerRightAnimation.value.defaultHeight(),
          left: (topRightAnimation.value + .1).defaultWidth(),
          child: CustomPaint(
            painter: MyPainter(60.h()),
          ),
        ),
        Positioned(
          top: .1.defaultHeight(),
          left: .8.defaultWidth(),
          child: CustomPaint(
            painter: MyPainter(bottomLeftAnimation.value),
          ),
        ),
        widget.child
      ],
    );
  }
}
