import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

@RoutePage()
class WavyTestScreen extends StatefulWidget {
  const WavyTestScreen({super.key});

  @override
  State<WavyTestScreen> createState() => _WavyTestScreenState();
}

class _WavyTestScreenState extends State<WavyTestScreen> {
  static const _backgroundColor = Colors.white;

  static const _colors = [
    Color(0xFFFEE440),
    Color(0xFF00BBF9),
  ];

  static const _durations = [
    5000,
    4000,
  ];

  static const _heightPercentages = [
    0.65,
    0.66,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            WaveWidget(
      config: CustomConfig(
            durations: _durations,
            heightPercentages: _heightPercentages,
            colors: _colors,

      ),
      backgroundColor: _backgroundColor,
      size: const Size(double.infinity, double.infinity),
      waveAmplitude: 0,
    ),

          ],
        ));
  }
}
