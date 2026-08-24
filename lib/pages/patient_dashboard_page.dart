import 'package:flutter/material.dart';
import '../widgets/movement_analysis_widget.dart';
import '../widgets/session_metrics_widget.dart';
import '../widgets/patient_evolution_widget.dart';
import '../widgets/session_objectives_widget.dart';
import '../widgets/therapist_notes_widget.dart';
import '../widgets/home_plan_widget.dart';
import '../widgets/mock_status_bar_widget.dart';

class PatientDashboardPage extends StatelessWidget {
  const PatientDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo cinza bem clarinho (típico de apps de saúde/clean)
      backgroundColor: const Color(0xFFF5F7FA),

      // Corpo da página com rolagem
      body: SafeArea(
        child: Column(
          children: [
            const MockStatusBarWidget(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 32),

                    const MovementAnalysisWidget(precision: 85.0),
                    const SizedBox(height: 32),

                    const SessionMetricsWidget(),
                    const SizedBox(height: 32),

                    const PatientEvolutionWidget(),
                    const SizedBox(height: 32),

                    const SessionObjectivesWidget(),
                    const SizedBox(height: 32),

                    const TherapistNotesWidget(),
                    const SizedBox(height: 32),

                    const HomePlanWidget(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ); // <--- O ERRO ESTAVA AQUI! Faltava esse fechamento do Scaffold.
  }

  // 1. Componente do Cabeçalho
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PACIENTE',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text(
                  'João S.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(width: 8),
                Text(
                  '— Sessão 4',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
        // Badge de Status "Concluído"
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 14),
              SizedBox(width: 4),
              Text(
                'Concluído',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}