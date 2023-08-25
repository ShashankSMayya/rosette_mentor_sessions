import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            right: -100,
            top: -100,
            child: _Circle(radius: 200),
          ),
          Positioned(
            left: 0,
            top: size.height/3,
            child: const _Circle(radius: 25),
          ),
          Positioned(
            right: 0,
            top: size.height/2,
            child: const _Circle(radius: 25),
          ),
          Positioned(
            left: -20,
            bottom: -20,
            child: const _Circle(radius: 100),
          ),
          child,
        ],
      ),
    );
  }
}



class _Circle extends StatelessWidget {
  final double radius;

  const _Circle({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: radius,
        height: radius,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            //#00F1FF4D, #399197
            gradient: LinearGradient(colors: [
              Color(0xFF00F1FF),
              Color(0xFF399197),
            ])));
  }
}