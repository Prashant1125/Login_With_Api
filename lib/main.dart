import 'package:flutter/material.dart';
import 'package:login_api/screens/login.dart';
import 'screens/signup.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Post Api',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SignUpPage(),
      // home: const LoginPage(),
    );
  }
}
