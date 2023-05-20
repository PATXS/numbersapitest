import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'numprov.dart';
import 'package:get/get.dart';
import 'prefs.dart';
import 'MyHomePage.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final darkThemePref darkThemePreference = darkThemePref();
  ThemeData appThemeLight = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );
  ThemeData appThemeDark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue, brightness: Brightness.dark),
  );
  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  void getCurrentTheme() async {
    ThemeData appTheme =
        await darkThemePreference.getTheme() ? appThemeDark : appThemeLight;
    Get.changeTheme(appTheme);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NumberProvider()..getNew(0),
      child: GetMaterialApp(
        title: 'Number App',
        theme: appThemeLight,
        darkTheme: appThemeDark,
        home: MyHomePage(),
      ),
    );
  }
}
