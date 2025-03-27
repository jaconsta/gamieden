import 'package:flutter/material.dart';

class GameLoading extends StatelessWidget {
  const GameLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("👾🔎", style: TextStyle(fontSize: 64)),
        Text("Loading search results.", style: theme.textTheme.headlineSmall),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
