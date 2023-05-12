import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'numprov.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NumberProvider()..getNew(0),
      child: MaterialApp(
        title: 'Number App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var numProv = context.watch<NumberProvider>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          body: SafeArea(
            minimum: EdgeInsets.all(24),
            child: <Widget>[TriviaPage(), MathPage(), YearPage()][selectedIndex]
          ),
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
              numProv.getNew(selectedIndex);
            },
            selectedIndex: selectedIndex,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                icon: Icon(Icons.question_mark_rounded),
                label: 'Trivia',
              ),
              NavigationDestination(
                icon: Icon(Icons.plus_one_rounded),
                label: 'Math',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_month_rounded),
                label: 'Year',
              ),
            ],
          ),
        );
      }
    );
  }
}


class TriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Numbers API", style: theme.textTheme.displayMedium),
          Text("Trivia", style: theme.textTheme.bodyLarge),
          SizedBox(height: 50),
          GeneratorWidget(index: 0)]));
  }
}

class MathPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Numbers API", style: theme.textTheme.displayMedium),
              Text("Math", style: theme.textTheme.bodyLarge),
              SizedBox(height: 50),
              GeneratorWidget(index: 1)]));
  }
}

class YearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Numbers API", style: theme.textTheme.displayMedium),
              Text("Year", style: theme.textTheme.bodyLarge),
              SizedBox(height: 50),
              GeneratorWidget(index: 2)]));
  }
}

class GeneratorWidget extends StatelessWidget {
  const GeneratorWidget({
    super.key,
    required this.index
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    var numProv = context.watch<NumberProvider>();
    String number = numProv.current;
    var fact = numProv.fact;
    final theme = Theme.of(context);
    final colortheme = <ThemeData>[theme, ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)), ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink))][index];
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
              )
          ),
          SizedBox(height: 10),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(fact, style: theme.textTheme.bodyLarge),
              )
          ),
          SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  numProv.getNew(index);
                },
                icon: Icon(Icons.numbers, size:20),
                label: Text('Random'),
              ),
            ],
          ),
        ],
      );
  }
}
