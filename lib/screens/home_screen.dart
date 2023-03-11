import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../share_preferences/preferences.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: Icon(Preferences.isDarkmode
            ? Icons.light_mode_outlined
            : Icons.dark_mode_outlined),
          onPressed: () {
            Preferences.isDarkmode = !Preferences.isDarkmode;
            Preferences.isDarkmode
              ? themeProvider.setDarkmode()
              : themeProvider.setLightmode();
          },
        ),
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
