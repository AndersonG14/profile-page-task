import 'dart:math';
import 'package:flutter/material.dart';

/// Componente que exibe o radar circular de precisão de movimento.
class MovementAnalysisWidget extends StatelessWidget {
  final double precision; // Ex: 85.0 para 85%

  const MovementAnalysisWidget({
    super.key,
    this.precision = 85.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Título da Seção
        const Text(
          'ANÁLISE DE MOVIMENTO',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),

        // Gráfico Circular de Precisão
        SizedBox(
          width: 220,
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 1. Anel de Sombra e Brilho Suave (Glow de Fundo)
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00E5FF).withOpacity(0.15),
                      blurRadius: 30,
                      spreadRadius: 8,
                    ),
                  ],
                ),
              ),

              // 2. Anéis e Arcos Desenhados via CustomPainter
              CustomPaint(
                size: const Size(200, 200),
                painter: _RadarChartPainter(progress: precision / 100),
              ),

              // 3. Conteúdo do Centro (Percentual)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'PRECISÃO',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${precision.toInt()}',
                        style: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        '%',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'média da sessão',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // 4. Legenda Inferior (Raio Inicial vs Executado)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegendItem(
              color: const Color(0xFF00E676), // Verde
              label: 'Raio Inicial',
            ),
            const SizedBox(width: 24),
            _buildLegendItem(
              color: const Color(0xFF2979FF), // Azul
              label: 'Executado',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 3,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// Painter customizado que desenha as linhas de grade concêntricas e o arco neon
class _RadarChartPainter extends CustomPainter {
  final double progress;

  _RadarChartPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // A. Linhas de Fundo (Círculos Guia Concêntricos)
    final gridPaint = Paint()
      ..color = const Color(0xFFE0F7FA).withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    canvas.drawCircle(center, radius * 0.92, gridPaint);
    canvas.drawCircle(center, radius * 0.68, gridPaint..color = const Color(0xFFF0F4F8));
    canvas.drawCircle(center, radius * 0.44, gridPaint..color = const Color(0xFFF5F7FA));

    // B. Arco de Progresso Ciano/Azul
    final rect = Rect.fromCircle(center: center, radius: radius * 0.92);
    final progressPaint = Paint()
      ..shader = const SweepGradient(
        colors: [
          Color(0xFF00E5FF),
          Color(0xFF2979FF),
          Color(0xFF00E5FF),
        ],
        startAngle: 0.0,
        endAngle: 2 * pi,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(rect, -pi / 2, sweepAngle, false, progressPaint);

    // C. Ponto Indicador Ciano na ponta do arco
    final dotAngle = -pi / 2 + sweepAngle;
    final dotX = center.dx + (radius * 0.92) * cos(dotAngle);
    final dotY = center.dy + (radius * 0.92) * sin(dotAngle);

    final dotBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final dotPaint = Paint()
      ..color = const Color(0xFF00E5FF)
      ..style = PaintingStyle.fill;

    // Desenha bolinha branca externa com miolo ciano
    canvas.drawCircle(Offset(dotX, dotY), 6, dotBorderPaint);
    canvas.drawCircle(Offset(dotX, dotY), 3.5, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _RadarChartPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}