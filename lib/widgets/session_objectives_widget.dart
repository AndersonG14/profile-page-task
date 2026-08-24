import 'package:flutter/material.dart';

class SessionObjectivesWidget extends StatelessWidget {
  const SessionObjectivesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da Seção
        const Text(
          'OBJETIVOS DA SESSÃO',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),

        // Card contendo a lista
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
            children: [
              _buildObjectiveItem(
                text: 'Manter precisão acima de 65%',
                isCompleted: true,
              ),
              const SizedBox(height: 16),
              _buildObjectiveItem(
                text: 'Aumentar velocidade média',
                isCompleted: true,
              ),
              const SizedBox(height: 16),
              _buildObjectiveItem(
                text: 'Reduzir variabilidade do movimento',
                isCompleted: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Construtor visual de cada item da lista
  Widget _buildObjectiveItem({required String text, required bool isCompleted}) {
    return Row(
      children: [
        // Checkbox Customizado
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: isCompleted ? const Color(0xFF00E676) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: isCompleted ? null : Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: isCompleted
              ? const Icon(Icons.check, size: 16, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 12),

        // Texto do Objetivo
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isCompleted ? FontWeight.bold : FontWeight.w500,
              color: isCompleted ? Colors.black87 : Colors.grey.shade500,
            ),
          ),
        ),
      ],
    );
  }
}