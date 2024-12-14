import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class PetActionsSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const PetActionsSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildActionButton(
            'Feed',
            Icons.restaurant,
            () => completer(SheetResponse(data: 'feed')),
          ),
          _buildActionButton(
            'Play',
            Icons.sports_esports,
            () => completer(SheetResponse(data: 'play')),
          ),
          _buildActionButton(
            'Clean',
            Icons.cleaning_services,
            () => completer(SheetResponse(data: 'clean')),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }
}
