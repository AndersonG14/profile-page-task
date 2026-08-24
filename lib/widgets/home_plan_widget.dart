import 'package:flutter/material.dart';

class HomePlanWidget extends StatelessWidget {
  const HomePlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PLANO DE CASA',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho Interno
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Exercícios em Casa',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    '4 exercícios',
                    style: TextStyle(color: Colors.blueAccent.shade400, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '22-26 Jul • Para fazer em casa',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
              const SizedBox(height: 24),

              // Lista de Exercícios
              _buildExerciseItem(
                icon: Icons.airline_seat_legroom_extra,
                iconBgColor: Colors.blueAccent,
                title: 'Extensão de Joelho',
                subtitle: '3 séries • 15 repetições',
              ),
              _buildDivider(),
              _buildExerciseItem(
                icon: Icons.nordic_walking,
                iconBgColor: Colors.green,
                title: 'Dorsiflexão Tornozelo',
                subtitle: '3 séries • 30 repetições',
              ),
              _buildDivider(),
              _buildExerciseItem(
                icon: Icons.compare_arrows,
                iconBgColor: Colors.orange,
                title: 'Equilíbrio Unipodal',
                subtitle: '3 séries • 30 segundos',
              ),
              _buildDivider(),
              _buildExerciseItem(
                icon: Icons.directions_walk,
                iconBgColor: Colors.redAccent,
                title: 'Caminhada Controlada',
                subtitle: '10 minutos • ritmo leve',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseItem({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(height: 1, color: Colors.grey.shade100),
    );
  }
}