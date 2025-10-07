import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/add_task/add_task.dart';
import 'package:tralalelo_pra_ukk/auth/auth_page.dart';
import 'package:tralalelo_pra_ukk/home/home_page.dart';
import 'theme/theme.dart'; //

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tralalelo App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthPage(),
        '/home': (context) => HomePage(),
        '/createTask': (context) => AddTaskScreen(),
      },
    );
  }
}
