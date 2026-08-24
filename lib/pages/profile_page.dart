import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/mock_status_bar_widget.dart';
import '../widgets/edit_profile_modal.dart';
import '../widgets/logout_modal.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
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
                    _buildHeader(context),
                    const SizedBox(height: 24),

                    _buildMainProfileCard(),
                    const SizedBox(height: 24),

                    _buildSectionTitle('ESTATÍSTICAS'),
                    const SizedBox(height: 12),
                    _buildStatisticsSection(),
                    const SizedBox(height: 24),

                    _buildSectionTitle('INFORMAÇÕES PESSOAIS'),
                    const SizedBox(height: 12),
                    _buildPersonalInfoCard(),
                    const SizedBox(height: 24),

                    _buildSectionTitle('REABILITAÇÃO'),
                    const SizedBox(height: 12),
                    _buildRehabCard(),
                    const SizedBox(height: 24),

                    _buildSectionTitle('PREFERÊNCIAS'),
                    const SizedBox(height: 12),
                    _buildPreferencesCard(),
                    const SizedBox(height: 24),

                    _buildSectionTitle('CONTA E SUPORTE'),
                    const SizedBox(height: 12),
                    _buildSupportCard(context),
                    const SizedBox(height: 32),

                    const Center(
                      child: Text(
                        'Versão 1.0.0 - Sessão segura',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // COMPONENTES DA TELA

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: child,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CONTA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2)),
            SizedBox(height: 4),
            Text('Perfil', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
          ],
        ),
        GestureDetector(
          onTap: () => _showBlurredModal(context, const EditProfileModal()),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: const Row(
              children: [
                Icon(Icons.edit, color: Colors.blueAccent, size: 16),
                SizedBox(width: 6),
                Text('Editar perfil', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 13)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainProfileCard() {
    return _buildCard(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blueAccent,
                child: Text('JS', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Container(
                width: 16, height: 16,
                decoration: BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 3)),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Text('João da Silva', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('Paciente em reabilitação', style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 14),
                SizedBox(width: 6),
                Text('Paciente ativo', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildProfileStat('24', 'Sessões'),
              _buildProfileStat('87%', 'Precisão'),
              _buildProfileStat('Sessão 4', 'Atual'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProfileStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildStatisticsSection() {
    return Row(
      children: [
        Expanded(child: _buildSmallStatCard('24', 'Sessões\nrealizadas', Colors.blueAccent)),
        const SizedBox(width: 12),
        Expanded(child: _buildSmallStatCard('87%', 'Taxa média de\nacerto', Colors.green)),
        const SizedBox(width: 12),
        Expanded(child: _buildSmallStatCard('+15%', 'Evolução total\n ', Colors.orange)),
      ],
    );
  }

  Widget _buildSmallStatCard(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey, height: 1.3)),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoCard() {
    return _buildCard(
      child: Column(
        children: [
          _buildIconRow(Icons.person_outline, 'Nome completo', 'João da Silva'),
          const Divider(height: 30, color: Color(0xFFEEEEEE)),
          _buildIconRow(Icons.email_outlined, 'E-mail', 'joao@email.com'),
          const Divider(height: 30, color: Color(0xFFEEEEEE)),
          _buildIconRow(Icons.phone_outlined, 'Telefone', '+55 83 91234-5678'),
          const Divider(height: 30, color: Color(0xFFEEEEEE)),
          _buildIconRow(Icons.calendar_today_outlined, 'Data de nascimento', '14 de março de 1980'),
        ],
      ),
    );
  }

  Widget _buildRehabCard() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextRow('Objetivo principal', 'Melhorar mobilidade e coordenação', Colors.black87),
          const SizedBox(height: 20),
          _buildTextRow('Frequência', '3 sessões por semana', Colors.blueAccent),
          const SizedBox(height: 20),
          _buildTextRow('Profissional responsável', 'Dr. Charlon Teles - Fisioterapeuta', Colors.black87),
          const SizedBox(height: 20),
          _buildTextRow('Início do tratamento', '12 de agosto de 2026', Colors.green),
        ],
      ),
    );
  }

  Widget _buildTextRow(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: valueColor)),
      ],
    );
  }

  Widget _buildPreferencesCard() {
    return _buildCard(
      child: Column(
        children: [
          _buildSwitchRow(Icons.notifications_none, 'Notificações', 'Receber alertas e avisos', true),
          const Divider(height: 30, color: Color(0xFFEEEEEE)),
          _buildSwitchRow(Icons.alarm, 'Lembretes de exercícios', 'Diariamente às 08:00', true),
        ],
      ),
    );
  }

  Widget _buildSwitchRow(IconData icon, String title, String subtitle, bool value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: Colors.green, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: (val) {},
          activeColor: Colors.white,
          activeTrackColor: Colors.green,
        ),
      ],
    );
  }

  Widget _buildSupportCard(BuildContext context) {
    return _buildCard(
      child: Column(
        children: [
          _buildActionRow(Icons.help_outline, 'Ajuda e suporte', subtitle: 'Central de atendimento'),
          const Divider(height: 30, color: Color(0xFFEEEEEE)),
          _buildActionRow(Icons.description_outlined, 'Termos de uso'),
          const Divider(height: 30, color: Color(0xFFEEEEEE)),
          _buildActionRow(Icons.privacy_tip_outlined, 'Política de privacidade'),
          const Divider(height: 30, color: Color(0xFFEEEEEE)),

          GestureDetector(
            onTap: () => _showBlurredModal(context, const LogoutModal()),
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.logout, color: Colors.redAccent, size: 20),
                ),
                const SizedBox(width: 16),
                const Expanded(child: Text('Sair da conta', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.redAccent))),
                const Icon(Icons.chevron_right, color: Colors.redAccent),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIconRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: Colors.blueAccent, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionRow(IconData icon, String title, {String? subtitle}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: Colors.grey.shade700, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ]
            ],
          ),
        ),
        Icon(Icons.chevron_right, color: Colors.grey.shade400),
      ],
    );
  }

  // Função do Desfoque (BackdropFilter)
  void _showBlurredModal(BuildContext context, Widget modalChild) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) => Stack(
        children: [
          // 1. O fundo desfocado e levemente escurecido
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
          ),
          // 2. O seu Modal original alinhado lá embaixo
          Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.down,
                onDismissed: (direction) {
                  Navigator.pop(context);
                },
                child: modalChild,
              ),
            ),
          ),
        ],
      ),
    );
  }
}