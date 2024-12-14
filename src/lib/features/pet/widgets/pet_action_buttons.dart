import 'package:flutter/material.dart';
import 'package:tamagotchi_stev/theme/custom_colors.dart';

class PetActionButtons extends StatelessWidget {
  final VoidCallback onFeed;
  final VoidCallback onPlay;
  final VoidCallback onClean;

  const PetActionButtons({
    Key? key,
    required this.onFeed,
    required this.onPlay,
    required this.onClean,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              onPressed: onFeed,
              icon: Icons.restaurant,
              label: 'Feed',
              color: CustomColors.success,
            ),
            _buildActionButton(
              onPressed: onPlay,
              icon: Icons.sports_esports,
              label: 'Play',
              color: CustomColors.warning,
            ),
            _buildActionButton(
              onPressed: onClean,
              icon: Icons.cleaning_services,
              label: 'Clean',
              color: CustomColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
