import 'package:flutter/material.dart';

import 'pages/registration_page.dart';

const Color tokoGreen = Color(0xFF168447);
const Color tokoPink = Color(0xFFFFF7FC);

void main() => runApp(const TokoTegarApp());

class TokoTegarApp extends StatelessWidget {
  const TokoTegarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Tegar',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: tokoGreen),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      ),
      home: const RegistrationPage(),
    );
  }
}
