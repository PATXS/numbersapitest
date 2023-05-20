import 'package:flutter/material.dart';
import 'GeneratorWidget.dart';

class MathPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Numbers API", style: theme.textTheme.displayMedium),
      Text("Math", style: theme.textTheme.bodyLarge),
      SizedBox(height: 50),
      GeneratorWidget(index: 1)
    ]));
  }
}
