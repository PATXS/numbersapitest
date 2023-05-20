import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'numprov.dart';

class GeneratorWidget extends StatelessWidget {
  const GeneratorWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    var numProv = context.watch<NumberProvider>();
    String number = numProv.current;
    var fact = numProv.fact;
    final theme = Theme.of(context);
    final colortheme = <ThemeData>[
      theme,
      ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)),
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink))
    ][index];
    final astyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Column(
      children: [
        Card(
            color: colortheme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(number, style: astyle),
            )),
        SizedBox(height: 10),
        Card(
            color: theme.colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(fact, style: theme.textTheme.bodyLarge),
            )),
        SizedBox(height: 30),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                numProv.getNew(index);
              },
              icon: Icon(Icons.numbers, size: 20),
              label: Text('Random'),
            ),
          ],
        ),
      ],
    );
  }
}
