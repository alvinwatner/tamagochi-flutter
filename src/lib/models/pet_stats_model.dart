import 'package:equatable/equatable.dart';

class PetStats extends Equatable {
  final int health;
  final int happiness;
  final int energy;

  const PetStats({
    required this.health,
    required this.happiness,
    required this.energy,
  });

  PetStats copyWith({
    int? health,
    int? happiness,
    int? energy,
  }) {
    return PetStats(
      health: health ?? this.health,
      happiness: happiness ?? this.happiness,
      energy: energy ?? this.energy,
    );
  }

  @override
  List<Object?> get props => [health, happiness, energy];
}
