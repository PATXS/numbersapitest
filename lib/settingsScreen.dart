import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:get/get.dart';
import 'prefs.dart';

class settingsScreen extends StatefulWidget {
  const settingsScreen({super.key});

  @override
  _settingsScreenState createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  bool isDark = Get.isDarkMode;
  darkThemePref darkThemePreference = darkThemePref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            title: Text('General'),
            tiles: [
              SettingsTile.switchTile(
                initialValue: isDark,
                onToggle: (value) {
                  Get.isDarkMode
                      ? Get.changeTheme(
                          ThemeData(
                            useMaterial3: true,
                            colorScheme:
                                ColorScheme.fromSeed(seedColor: Colors.blue),
                          ),
                        )
                      : Get.changeTheme(
                          ThemeData(
                            useMaterial3: true,
                            colorScheme: ColorScheme.fromSeed(
                                seedColor: Colors.blue,
                                brightness: Brightness.dark),
                          ),
                        );
                  setState(() {
                    isDark = value;
                    darkThemePreference.setDarkTheme(value);
                  });
                },
                leading: isDark
                    ? Icon(Icons.dark_mode_rounded)
                    : Icon(Icons.light_mode_rounded),
                title: Text('Enable dark mode'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
