import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tralalelo_pra_ukk/add_task/add_task.dart';
import 'package:tralalelo_pra_ukk/auth/auth_page.dart';
import 'package:tralalelo_pra_ukk/core/env.dart';
import 'package:tralalelo_pra_ukk/home/home_page.dart';
import 'theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  Supabase.initialize(url: Env.supaBaseUrl, anonKey: Env.supaBaseAnonKey);

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
