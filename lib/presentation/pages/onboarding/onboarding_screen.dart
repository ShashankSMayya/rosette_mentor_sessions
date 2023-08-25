import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:test_practice/gen/assets.gen.dart';
import 'package:test_practice/presentation/widgets/background_widget.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Welcome to ',
                  style: Theme.of(context).textTheme.headlineLarge,
                  children: [
                    TextSpan(
                      text: 'Rosette',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Assets.svgs.bottle1.svg(),



            ],
          ),
        ),
      ),
    );
  }
}
