import 'package:flutter/material.dart';
import 'package:test_practice/domain/entities/app_error.dart';

class CustomErrorWidget extends StatelessWidget {
  final AppError error;
  final VoidCallback? onPressed;

  const CustomErrorWidget({
    super.key,
    required this.error,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          error.type.icon,
          size: 100,
        ),
        Text(error.errorMessage),
        if (onPressed != null)
          ElevatedButton(onPressed: onPressed, child: const Text('Retry'))
      ],
    );
  }
}
