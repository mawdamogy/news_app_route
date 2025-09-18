import 'package:flutter/material.dart';
import 'package:news_app_route/ui/home/home_screen.dart';
import 'package:news_app_route/utils/app_route.dart';
import 'package:news_app_route/utils/app_theme.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homeRoute,
      routes: {
        AppRoute.homeRoute: (context) => HomeScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darktheme,
      themeMode: ThemeMode.dark,
    );
  }
}
