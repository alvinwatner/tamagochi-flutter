import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          onPressed: onFeed,
          icon: Icons.restaurant,
          label: 'Feed',
        ),
        _buildActionButton(
          onPressed: onPlay,
          icon: Icons.sports_esports,
          label: 'Play',
        ),
        _buildActionButton(
          onPressed: onClean,
          icon: Icons.cleaning_services,
          label: 'Clean',
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: 32,
        ),
        Text(label),
      ],
    );
  }
}
