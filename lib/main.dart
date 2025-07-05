import 'package:flutter/material.dart';
import 'package:indrav_assignment/presentation/screens/age_group_page.dart';
import 'package:indrav_assignment/presentation/screens/login_page.dart';
import 'core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indrav Health',
      theme: futuristicTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginPage(),
        '/age-group': (_) => const AgeGroupPage(),
      },
    );
  }
}
