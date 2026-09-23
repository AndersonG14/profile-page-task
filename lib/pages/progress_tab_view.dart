import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgressTabView extends StatefulWidget {
  const ProgressTabView({super.key});

  @override
  State<ProgressTabView> createState() => _ProgressTabViewState();
}

class _ProgressTabViewState extends State<ProgressTabView> {
  // Estado para controlar o filtro de tempo selecionado
  String _selectedPeriod = '3 meses';

  // Dados dinâmicos do Progresso Geral com base no filtro selecionado
  Map<String, dynamic> get _currentProgressData {
    switch (_selectedPeriod) {
      case '7 dias':
        return {
          'progressValue': 0.45,
          'percentageText': '45%',
          'growthText': '+8% esta semana',
          'sessions': '2',
          'activeDays': '3',
          'streak': '1',
        };
      case '30 dias':
        return {
          'progressValue': 0.70,
          'percentageText': '70%',
          'growthText': '+18% este mês',
          'sessions': '8',
          'activeDays': '12',
          'streak': '2',
        };
      case '3 meses':
      default:
        return {
          'progressValue': 0.85,
          'percentageText': '85%',
          'growthText': '+25% desde o início',
          'sessions': '14',
          'activeDays': '28',
          'streak': '3',
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- PARTE 1: Cabeçalho, Seletor Interativo e Progresso Geral ---
              _buildHeader(),
              const SizedBox(height: 24),
              _buildTimeFilter(),
              const SizedBox(height: 32),
              const Text(
                'PROGRESSO GERAL',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              _buildGeneralProgressCard(),
              const SizedBox(height: 32),

              // --- PARTE 2: Evolução do Desempenho e Métricas ---
              _buildPerformanceSection(),
              const SizedBox(height: 32),

              // --- PARTE 3: Metas de Reabilitação ---
              const Text(
                'METAS DE REABILITAÇÃO',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              _buildRehabilitationGoalsSection(),
              const SizedBox(height: 32),

              // --- PARTE 4: Comparação Semanal ---
              const Text(
                'COMPARAÇÃO SEMANAL',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              _buildWeeklyComparisonSection(),
              const SizedBox(height: 32),

              // --- PARTE 5: Qualidade do Movimento ---
              const Text(
                'QUALIDADE DO MOVIMENTO',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              _buildMovementQualitySection(),
              const SizedBox(height: 32),

              // --- PARTE 6: Conquistas ---
              const Text(
                'CONQUISTAS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              _buildAchievementsSection(),
              const SizedBox(height: 32),

              // --- PARTE 7: Observação do Terapeuta ---
              const Text(
                'OBSERVAÇÃO DO TERAPEUTA',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              _buildTherapistObservationSection(),
              const SizedBox(height: 48), // Espaço extra no final da tela
            ],
          ),
        ),
      ),
    );
  }

  // ===========================================================================
  // PARTE 1: CABEÇALHO, FILTRO DE TEMPO E PROGRESSO GERAL
  // ===========================================================================

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'REABILITAÇÃO',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Progresso',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(Icons.circle, size: 8, color: Colors.blue),
              const SizedBox(width: 6),
              Text(
                _selectedPeriod,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeFilter() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: _buildFilterTab('7 dias')),
          Expanded(child: _buildFilterTab('30 dias')),
          Expanded(child: _buildFilterTab('3 meses')),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label) {
    final isSelected = _selectedPeriod == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPeriod = label;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey.shade600,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGeneralProgressCard() {
    final data = _currentProgressData;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey<String>(_selectedPeriod),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              width: 220,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 16,
                    color: Colors.grey.shade100,
                  ),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const SweepGradient(
                        startAngle: 0.0,
                        endAngle: 6.28,
                        colors: [Colors.blue, Colors.greenAccent],
                        stops: [0.0, 1.0],
                        transform: GradientRotation(-1.57),
                      ).createShader(bounds);
                    },
                    child: CircularProgressIndicator(
                      value: data['progressValue'],
                      strokeWidth: 16,
                      backgroundColor: Colors.transparent,
                      valueColor: const AlwaysStoppedAnimation(Colors.white),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['percentageText'],
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Evolução geral',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.keyboard_arrow_up,
                                size: 16, color: Colors.green),
                            Text(
                              data['growthText'],
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Divider(color: Colors.grey.shade200, height: 1),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(data['sessions'], 'Sessões'),
                _buildStatItem(data['activeDays'], 'Dias ativos'),
                _buildStatItem(data['streak'], 'Sequência'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
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

  // ===========================================================================
  // PARTE 2: EVOLUÇÃO DO DESEMPENHO E MÉTRICAS
  // ===========================================================================

  Widget _buildPerformanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'EVOLUÇÃO DO DESEMPENHO',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        _buildPrecisionChartCard(),
        const SizedBox(height: 32),
        const Text(
          'MÉTRICAS DE DESEMPENHO',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildMetricCard(
              title: 'Precisão',
              value: '88',
              unit: '%',
              valueColor: const Color(0xFF1E88E5),
              badgeText: '+13%',
            ),
            const SizedBox(width: 10),
            _buildMetricCard(
              title: 'Vel. Média',
              value: '14',
              unit: 'cm/s',
              valueColor: const Color(0xFF00C853),
              badgeText: '+5 cm/s',
            ),
            const SizedBox(width: 10),
            _buildMetricCard(
              title: 'Taxa Acerto',
              value: '92',
              unit: '%',
              valueColor: const Color(0xFFFF9100),
              badgeText: '+11%',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPrecisionChartCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Precisão por sessão',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('6 sessões · 3 meses',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.keyboard_arrow_up,
                        size: 14, color: Colors.green),
                    SizedBox(width: 2),
                    Text('+13%',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withOpacity(0.12),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (value, meta) {
                        if (value == 72 || value == 79 || value == 87) {
                          return Text('${value.toInt()}%',
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey));
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        final labels = ['S1', 'S2', 'S3', 'S4', 'S5', 'S6'];
                        int index = value.toInt();
                        if (index >= 0 && index < labels.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              labels[index],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 5,
                minY: 65,
                maxY: 95,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 72),
                      FlSpot(1, 76),
                      FlSpot(2, 79),
                      FlSpot(3, 82),
                      FlSpot(4, 85),
                      FlSpot(5, 88)
                    ],
                    isCurved: false,
                    color: const Color(0xFF1E88E5),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                        radius: 4,
                        color: Colors.white,
                        strokeWidth: 3,
                        strokeColor: const Color(0xFF00E676),
                      ),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF1E88E5).withOpacity(0.18),
                          const Color(0xFF1E88E5).withOpacity(0.0)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.grey.shade200, height: 1),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 18,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E88E5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              const Text('Precisão',
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(width: 24),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF00E676),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text('Sessão individual',
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String unit,
    required Color valueColor,
    required String badgeText,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.keyboard_arrow_up,
                      size: 12, color: Colors.green),
                  Flexible(
                    child: Text(
                      badgeText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // PARTE 3 E 4: METAS DE REABILITAÇÃO E COMPARAÇÃO SEMANAL
  // ===========================================================================

  Widget _buildRehabilitationGoalsSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildGoalItem(
            title: 'Precisão acima de 85%',
            progress: 1.0,
            progressText: '100%',
            isCompleted: true,
          ),
          Divider(color: Colors.grey.shade100, height: 32, thickness: 1),
          _buildGoalItem(
            title: 'Velocidade média de 15 cm/s',
            progress: 0.93,
            progressText: '93%',
            isCompleted: false,
          ),
          Divider(color: Colors.grey.shade100, height: 32, thickness: 1),
          _buildGoalItem(
            title: 'Reduzir variabilidade do movimento',
            progress: 0.82,
            progressText: '82%',
            isCompleted: false,
          ),
        ],
      ),
    );
  }

  Widget _buildGoalItem({
    required String title,
    required double progress,
    required String progressText,
    required bool isCompleted,
  }) {
    final activeColor =
        isCompleted ? const Color(0xFF00C853) : const Color(0xFF1E88E5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isCompleted ? activeColor : Colors.transparent,
                border: Border.all(
                  color: isCompleted ? activeColor : Colors.grey.shade300,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Text(
              progressText,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: activeColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(activeColor),
            minHeight: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyComparisonSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Comparação semanal',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('Precisão média',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.keyboard_arrow_up,
                        size: 14, color: Colors.green),
                    SizedBox(width: 2),
                    Text('+6%',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildComparisonInnerCard(
                  label: 'ESTA SEMANA',
                  value: '88%',
                  description: 'Média de precisão',
                  backgroundColor: const Color(0xFFEFF6FF),
                  borderColor: const Color(0xFFDDEBFF),
                  valueColor: const Color(0xFF1E88E5),
                  labelColor: const Color(0xFF1E88E5),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildComparisonInnerCard(
                  label: 'SEM. ANTERIOR',
                  value: '82%',
                  description: 'Média de precisão',
                  backgroundColor: const Color(0xFFF8FAFC),
                  borderColor: Colors.grey.shade200,
                  valueColor: Colors.black54,
                  labelColor: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonInnerCard({
    required String label,
    required String value,
    required String description,
    required Color backgroundColor,
    required Color borderColor,
    required Color valueColor,
    required Color labelColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: labelColor,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: valueColor,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // PARTE 5: QUALIDADE DO MOVIMENTO
  // ===========================================================================

  Widget _buildMovementQualitySection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Indicadores de qualidade',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Baseado nas últimas 6 sessões',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCircularQualityIndicator(
                value: 0.88,
                percentageText: '88%',
                label: 'Precisão',
                color: const Color(0xFF1E88E5),
              ),
              _buildCircularQualityIndicator(
                value: 0.86,
                percentageText: '86%',
                label: 'Suavidade',
                color: const Color(0xFF00C853),
              ),
              _buildCircularQualityIndicator(
                value: 0.91,
                percentageText: '91%',
                label: 'Consistência',
                color: const Color(0xFF5E35B1),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.grey.shade100, height: 1, thickness: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem('Precisão', const Color(0xFF1E88E5)),
              const SizedBox(width: 16),
              _buildLegendItem('Suavidade', const Color(0xFF00C853)),
              const SizedBox(width: 16),
              _buildLegendItem('Consistência', const Color(0xFF5E35B1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularQualityIndicator({
    required double value,
    required String percentageText,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 6,
                color: Colors.grey.shade100,
              ),
              CircularProgressIndicator(
                value: value,
                strokeWidth: 6,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(color),
                strokeCap: StrokeCap.round,
              ),
              Center(
                child: Text(
                  percentageText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Icon(Icons.circle, size: 8, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  // ===========================================================================
  // PARTE 6: CONQUISTAS
  // ===========================================================================

  Widget _buildAchievementsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildAchievementItem(
            title: 'Primeira meta atingida',
            description: 'Precisão acima de 85% alcançada na Sessão 4.',
            isObtained: true,
          ),
          Divider(color: Colors.grey.shade100, height: 1, thickness: 1),
          _buildAchievementItem(
            title: 'Rotina consistente',
            description:
                'Você completou 4 sessões seguindo a frequência recomendada.',
            isObtained: true,
          ),
          Divider(color: Colors.grey.shade100, height: 1, thickness: 1),
          _buildAchievementItem(
            title: 'Velocidade avançada',
            description:
                'Alcance 15 cm/s de velocidade média para desbloquear.',
            isObtained: false,
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem({
    required String title,
    required String description,
    required bool isObtained,
  }) {
    final iconColor =
        isObtained ? const Color(0xFFFFB300) : Colors.grey.shade400;
    final iconBgColor =
        isObtained ? const Color(0xFFFFF8E1) : Colors.grey.shade100;
    final titleColor = isObtained ? Colors.black87 : Colors.grey.shade500;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    isObtained ? const Color(0xFFFFE082) : Colors.grey.shade200,
                width: 1,
              ),
            ),
            child: Icon(Icons.star_border_rounded, color: iconColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          if (isObtained) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: const Text(
                'Obtida',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ===========================================================================
  // PARTE 7: OBSERVAÇÃO DO TERAPEUTA
  // ===========================================================================

  Widget _buildTherapistObservationSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho da Doutora
          Row(
            children: [
              // Avatar do profissional
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF673AB7),
                ),
                child: const Center(
                  child: Text(
                    'DR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Nome e Cargo
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Dra. Renata Alves',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Fisioterapeuta · Atualizado hoje',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Ícone de aspas decorativo
          Text(
            '“',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade300,
              height: 0.8,
            ),
          ),
          const SizedBox(height: 8),
          // Texto de feedback em itálico
          const Text(
            'O paciente apresentou evolução consistente na precisão dos movimentos nas últimas sessões. Recomenda-se manter a frequência atual dos exercícios e iniciar progressão de carga na próxima semana.',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          // Badges / Tags
          Row(
            children: [
              _buildTherapistBadge(
                label: 'Evolução positiva',
                backgroundColor: const Color(0xFFE8F5E9),
                borderColor: const Color(0xFFA5D6A7),
                textColor: const Color(0xFF2E7D32),
              ),
              const SizedBox(width: 10),
              _buildTherapistBadge(
                label: 'Manter protocolo',
                backgroundColor: const Color(0xFFE3F2FD),
                borderColor: const Color(0xFF90CAF9),
                textColor: const Color(0xFF1976D2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTherapistBadge({
    required String label,
    required Color backgroundColor,
    required Color borderColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}