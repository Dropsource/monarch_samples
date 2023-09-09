import 'package:flutter/material.dart';
import 'package:monarch_samples_pretty/src/onboarding/components/care_view.dart';
import 'package:monarch_samples_pretty/src/onboarding/components/mood_diary_vew.dart';
import 'package:monarch_samples_pretty/src/onboarding/components/relax_view.dart';
import 'package:monarch_samples_pretty/src/onboarding/components/splash_view.dart';
import 'package:monarch_samples_pretty/src/onboarding/components/welcome_view.dart';
import 'package:monarch_samples_pretty/src/onboarding/introduction_animation_screen.dart';




Widget full_onboarding() => IntroductionAnimationScreen();

Widget onboarding_1_splash() =>
    IntroductionAnimationScreen(initial: 0.0, target: 0.0);

Widget onboarding_2_relax() =>
    IntroductionAnimationScreen(initial: 0.0, target: 0.2);

Widget onboarding_3_care() =>
    IntroductionAnimationScreen(initial: 0.2, target: 0.4);

Widget onboarding_4_mood() =>
    IntroductionAnimationScreen(initial: 0.4, target: 0.6);

Widget onboarding_5_welcome() =>
    IntroductionAnimationScreen(initial: 0.6, target: 0.8);





Widget view_1_splash() => Animated(
      (animationController) =>
          SplashView(animationController: animationController),
      animationTarget: 0.0,
    );

Widget view_2_relax() => Animated(
      (animationController) =>
          RelaxView(animationController: animationController),
      animationTarget: 0.2,
    );

Widget view_3_care() => Animated(
      (animationController) =>
          CareView(animationController: animationController),
      animationTarget: 0.4,
    );

Widget view_4_mood() => Animated(
      (animationController) =>
          MoodDiaryVew(animationController: animationController),
      animationTarget: 0.6,
    );

Widget view_5_welcome() => Animated(
      (animationController) =>
          WelcomeView(animationController: animationController),
      animationTarget: 0.8,
    );

class Animated extends StatefulWidget {
  final Widget Function(AnimationController) screen;
  final double animationTarget;

  Animated(this.screen, {required this.animationTarget});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedState();
  }
}

class _AnimatedState extends State<Animated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  _AnimatedState();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        value: widget.animationTarget - 0.2,
        vsync: this,
        duration: Duration(seconds: 8));

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _controller.animateTo(widget.animationTarget));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF7EBE1),
        body: ClipRect(
            child: Stack(
          children: [widget.screen(_controller)],
        )));
  }
}
