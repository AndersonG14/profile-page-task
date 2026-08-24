import 'package:flutter/material.dart';
import 'dart:async';

class MockStatusBarWidget extends StatefulWidget {
  const MockStatusBarWidget({super.key});

  @override
  State<MockStatusBarWidget> createState() => _MockStatusBarWidgetState();
}

class _MockStatusBarWidgetState extends State<MockStatusBarWidget> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();

    // Configura um timer para rodar a cada 1 segundo.
    // Usamos 1 segundo em vez de 1 minuto para que a virada do minuto na tela
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    // Formata a hora para ficar sempre com 2 dígitos (ex: 09:05)
    final formattedTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    // Só atualiza a tela se o minuto tiver mudado para economizar processamento
    if (_currentTime != formattedTime) {
      setState(() {
        _currentTime = formattedTime;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _currentTime,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              letterSpacing: 0.5,
            ),
          ),

          const Row(
            children: [
              Icon(Icons.signal_cellular_4_bar_rounded, size: 16, color: Colors.black87),
              SizedBox(width: 6),
              Icon(Icons.wifi, size: 16, color: Colors.black87),
              SizedBox(width: 6),
              // Simula o ícone de bateria (usando um container para parecer o do iOS)
              Icon(Icons.battery_full_rounded, size: 18, color: Colors.black87),
            ],
          ),
        ],
      ),
    );
  }
}