import 'package:flutter/material.dart';
import 'package:tamagotchi_stev/theme/custom_colors.dart';

class PetAnimationWidget extends StatefulWidget {
  final String petState;

  const PetAnimationWidget({
    Key? key,
    required this.petState,
  }) : super(key: key);

  @override
  State<PetAnimationWidget> createState() => _PetAnimationWidgetState();
}

class _PetAnimationWidgetState extends State<PetAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getEmoji() {
    switch (widget.petState) {
      case 'happy':
        return '😊';
      case 'sad':
        return '😢';
      case 'tired':
        return '😴';
      case 'sick':
        return '🤒';
      default:
        return '🐱';
    }
  }

  Color _getBackgroundColor() {
    switch (widget.petState) {
      case 'happy':
        return CustomColors.success.withOpacity(0.2);
      case 'sad':
        return CustomColors.warning.withOpacity(0.2);
      case 'tired':
        return CustomColors.primary.withOpacity(0.2);
      case 'sick':
        return CustomColors.error.withOpacity(0.2);
      default:
        return CustomColors.background;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Text(
                _getEmoji(),
                style: TextStyle(
                  fontSize: 80 + _animation.value,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
