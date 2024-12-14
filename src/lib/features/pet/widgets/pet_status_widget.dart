import 'package:flutter/material.dart';
import 'package:tamagotchi_stev/theme/custom_colors.dart';

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
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatusBar('Health', health, CustomColors.error),
            const SizedBox(height: 12),
            _buildStatusBar('Happiness', happiness, CustomColors.warning),
            const SizedBox(height: 12),
            _buildStatusBar('Energy', energy, CustomColors.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar(String label, int value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$value%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value / 100,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 10,
          ),
        ),
      ],
    );
  }
}
