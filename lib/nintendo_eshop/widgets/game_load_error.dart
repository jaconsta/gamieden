import 'package:flutter/material.dart';

class GameLoadError extends StatelessWidget {
  final String errorMessage;

  const GameLoadError({super.key, String? text})
    : errorMessage = text ?? "Something went wrong";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("😩", style: TextStyle(fontSize: 64)),
        Text(errorMessage, style: theme.textTheme.headlineSmall),
      ],
    );
  }
}
