import 'package:flutter/material.dart';

class TherapistNotesWidget extends StatelessWidget {
  const TherapistNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'NOTAS DO TERAPEUTA',
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
              // 1. Cabeçalho com Avatar
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.indigo.shade400,
                    child: const Text(
                      'DR',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dra. Renata Alves',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'Fisioterapeuta • Hoje, 14:30',
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 2. Texto das notas
              Text(
                'João demonstrou boa coordenação nos exercícios de extensão. '
                    'Observar possível compensação de quadril na próxima sessão. '
                    'Aumentar resistência gradualmente. Progresso dentro do esperado '
                    'para a 4ª sessão -> continuar protocolo atual.',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),

              // 3. Tags / Chips
              Row(
                children: [
                  _buildTag(text: 'Extensão de Joelho', color: Colors.blueAccent),
                  const SizedBox(width: 8),
                  _buildTag(text: 'Dor/Fisgadas', color: Colors.green),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTag({required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}