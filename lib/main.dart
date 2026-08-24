import 'package:flutter/material.dart';
import 'pages/main_navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoramento do Paciente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', // ou a fonte padrão do seu sistema
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const MainNavigationPage(),
    );
  }
}
