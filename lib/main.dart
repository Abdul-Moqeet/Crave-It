import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delievery/providers/theme_provider.dart';
import 'package:food_delievery/view/start/Navigation.dart';
import 'package:food_delievery/view/start/first.dart';
void main() {
  //  SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.transparent,
  //   ),
  // );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme_mode = ref.watch(themeNotifierProvider);
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
       scaffoldBackgroundColor: Color.fromARGB(255, 240, 240, 241),
       
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color.fromARGB(255, 45, 41, 41),
         colorScheme: const ColorScheme.dark(
    primary: Color(0xFF121212),
    // secondary: Color(0xFFBB86FC),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ), cardTheme: const CardTheme(
    elevation: 4, // Subtle shadow
    color: Color.fromARGB(255, 56, 55, 55), // Let the colorScheme handle it
  ),
        
        
      ),
      themeMode: theme_mode,
     
        home:  const first_page()
      ),
    );
  }
}

