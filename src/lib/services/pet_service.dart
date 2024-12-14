import 'package:tamagotchi_stev/features/pet/pet_repository.dart';
import 'package:tamagotchi_stev/models/pet_model.dart';
import 'package:tamagotchi_stev/models/pet_stats_model.dart';

class PetService {
  final PetRepository _repository = PetRepository();
  static const int maxStat = 100;
  static const int minStat = 0;
  static const int statChangeAmount = 10;

  bool get hasPet => _repository.currentPet != null;
  Pet? get currentPet => _repository.currentPet;

  Future<Pet> createPet(String name) async {
    return _repository.createPet(name);
  }

  Future<void> feedPet() async {
    if (!hasPet) return;

    final currentStats = currentPet!.stats;
    final newStats = currentStats.copyWith(
      health: _calculateNewStatValue(currentStats.health + statChangeAmount),
      energy: _calculateNewStatValue(currentStats.energy + statChangeAmount),
    );

    await _repository.updatePetStats(newStats);
  }

  Future<void> playWithPet() async {
    if (!hasPet) return;

    final currentStats = currentPet!.stats;
    final newStats = currentStats.copyWith(
      happiness:
          _calculateNewStatValue(currentStats.happiness + statChangeAmount),
      energy: _calculateNewStatValue(currentStats.energy - statChangeAmount),
    );

    await _repository.updatePetStats(newStats);
  }

  Future<void> cleanPet() async {
    if (!hasPet) return;

    final currentStats = currentPet!.stats;
    final newStats = currentStats.copyWith(
      health: _calculateNewStatValue(currentStats.health + statChangeAmount),
      happiness:
          _calculateNewStatValue(currentStats.happiness + statChangeAmount),
    );

    await _repository.updatePetStats(newStats);
  }

  int _calculateNewStatValue(int value) {
    if (value > maxStat) return maxStat;
    if (value < minStat) return minStat;
    return value;
  }
}
