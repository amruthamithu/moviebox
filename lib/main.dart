import 'package:flutter/material.dart';
import 'package:moviebox/pages/home_page.dart';
import 'package:moviebox/pages/login_page.dart';
import 'package:moviebox/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Box',
      theme: ThemeData(
        fontFamily: "ArchitectsDaughter",
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'register': ((context) => const RegisterPage()),
        'login': (context) => const LoginPage(),
        'home': (context) => const HomePage(),
      },
    );
  }
}
