import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delievery/providers/theme_provider.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final themeNotifier = ref.read(themeNotifierProvider.notifier);
    final isDarkMode = ref.watch(themeNotifierProvider) == ThemeMode.dark;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(
             child: Switch(
              value: isDarkMode,
              onChanged: (value) {
                themeNotifier.toggleTheme();
              },
                       ),
           )
        ],
      ),
    );
  }
}