import 'package:equatable/equatable.dart';
import 'package:tamagotchi_stev/models/pet_stats_model.dart';

class Pet extends Equatable {
  final String id;
  final String name;
  final DateTime birthday;
  final PetStats stats;

  const Pet({
    required this.id,
    required this.name,
    required this.birthday,
    required this.stats,
  });

  Pet copyWith({
    String? id,
    String? name,
    DateTime? birthday,
    PetStats? stats,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      stats: stats ?? this.stats,
    );
  }

  @override
  List<Object?> get props => [id, name, birthday, stats];
}
