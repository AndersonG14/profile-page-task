import 'package:flutter/material.dart';
import 'patient_dashboard_page.dart';
import 'profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PatientDashboardPage(),
    const _DummyPage(title: 'Página de Sessões'),
    const _DummyPage(title: 'Página de Progresso'),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // 1. Scaffold Externo (Fundo da tela do computador)
    return Scaffold(
      backgroundColor: Colors.grey.shade300, // Cinza mais escuro nas laterais
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500), // Largura fixa de celular

          // 2. Scaffold Interno (O seu App de verdade)
          child: Scaffold(
            backgroundColor: const Color(0xFFF5F7FA),
            body: _pages[_currentIndex],

            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Sessões'),
                BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Progresso'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DummyPage extends StatelessWidget {
  final String title;
  const _DummyPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}