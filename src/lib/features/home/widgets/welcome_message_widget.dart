import 'package:flutter/material.dart';
import 'package:tamagotchi_stev/theme/custom_colors.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          'Welcome to TamagotchiStev!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: CustomColors.primary,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          'Create and take care of your very own virtual pet!',
          style: TextStyle(
            fontSize: 16,
            color: CustomColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
