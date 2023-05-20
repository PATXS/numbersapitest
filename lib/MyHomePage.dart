import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'numprov.dart';
import 'settingsScreen.dart';
import 'TriviaPage.dart';
import 'MathPage.dart';
import 'YearPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    var numProv = context.watch<NumberProvider>();
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: SafeArea(
            minimum: EdgeInsets.all(24),
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: [TriviaPage(), MathPage(), YearPage()],
            )),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const settingsScreen()),
              );
            } else {
              controller.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic);
              setState(() {
                selectedIndex = index;
              });
              numProv.getNew(selectedIndex);
            }
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
            NavigationDestination(
              icon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
        ),
      );
    });
  }
}
