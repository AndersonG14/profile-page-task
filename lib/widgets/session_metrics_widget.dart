import 'package:flutter/material.dart';

class SessionMetricsWidget extends StatelessWidget {
  const SessionMetricsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção
        const Text(
          'MÉTRICAS DA SESSÃO',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),

        // Linha com os 3 Cards
        Row(
          children: [
            Expanded(
              child: _MetricCard(
                title: 'Precisão',
                value: '85',
                unit: '%',
                trendIcon: Icons.trending_up,
                trendColor: Colors.green,
                trendText: 'Meta: 80%',
              ),
            ),
            const SizedBox(width: 8), // Espaço entre os cards
            Expanded(
              child: _MetricCard(
                title: 'Vel. Média',
                value: '12',
                unit: 'km/h',
                trendIcon: Icons.trending_down,
                trendColor: Colors.orange,
                trendText: 'Baixa (15)',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _MetricCard(
                title: 'Força Aplic.',
                value: '98',
                unit: 'N',
                trendIcon: Icons.check_circle_outline,
                trendColor: Colors.green,
                trendText: 'Ideal (90)',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Widget privado (_MetricCard) que desenha o visual de cada card individual.
class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData trendIcon;
  final Color trendColor;
  final String trendText;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.trendIcon,
    required this.trendColor,
    required this.trendText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                unit,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(trendIcon, size: 12, color: trendColor),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  trendText,
                  style: TextStyle(
                    fontSize: 10,
                    color: trendColor,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}