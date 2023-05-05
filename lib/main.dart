import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
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

class MyAppState extends ChangeNotifier {
  var rand = Random();
  var current = 0;
  var fact = "This number is a number.";
  void getNew(bool mathf) {
    current = rand.nextInt(200);
    var math = "";
    if(mathf) math = "/math";
    http.get(
      Uri.parse('http://numbersapi.com/$current$math'),
    ).then((resp) {
      //print(resp.body.toString());
      fact = resp.body.toString();
      notifyListeners();
    });
    notifyListeners();
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: GeneratorPage(),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    //appState.getNew();
    var number = appState.current;
    var fact = appState.fact;
    final theme = Theme.of(context);
    final astyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Numbers API", style: theme.textTheme.displayMedium),
          SizedBox(height: 50),
          Card(
          color: theme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(number.toString(), style: astyle),
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
                  appState.getNew(false);
                },
                icon: Icon(Icons.numbers, size:20),
                label: Text('Random'),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {
                  appState.getNew(true);
                },
                icon: Icon(Icons.plus_one, size:20),
                label: Text('Random (Math)'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
