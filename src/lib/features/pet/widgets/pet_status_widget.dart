import 'package:flutter/material.dart';

class PetStatusWidget extends StatelessWidget {
  final int health;
  final int happiness;
  final int energy;

  const PetStatusWidget({
    Key? key,
    required this.health,
    required this.happiness,
    required this.energy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatusBar('Health', health, Colors.red),
            const SizedBox(height: 8),
            _buildStatusBar('Happiness', happiness, Colors.yellow),
            const SizedBox(height: 8),
            _buildStatusBar('Energy', energy, Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar(String label, int value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: $value%',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: value / 100,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 8,
        ),
      ],
    );
  }
}
