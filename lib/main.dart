import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themeswitcher/AppNotifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Dark/Light Theme Switcher',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const ThemeSwitcher(),
          themeMode:
              appState.isDarkThemeEnabled ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark/Light Theme Switcher'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current Theme:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              themeModel.isDarkThemeEnabled ? 'Dark' : 'Light',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Switch(
              value: themeModel.isDarkThemeEnabled,
              onChanged: (value) {
                themeModel.toggleTheme();
              },
            ),
            const Text(
              'Toggle Theme',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.all(16),
          child: Center(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'www.flutterforgeeks.com',
                style: TextStyle(color: Colors.green, fontSize: 24),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ))),
    );
  }
}
