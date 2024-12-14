import 'package:tamagotchi_stev/features/pet/pet_repository.dart';
import 'package:tamagotchi_stev/models/pet_model.dart';
import 'package:tamagotchi_stev/models/pet_stats_model.dart';
import 'package:tamagotchi_stev/core/error/game_initialization_error.dart';

class PetService {
  final PetRepository _repository = PetRepository();
  static const int maxStat = 100;
  static const int minStat = 0;
  static const int statChangeAmount = 10;

  bool get hasPet => _repository.currentPet != null;
  Pet? get currentPet => _repository.currentPet;

  Future<Pet> createPet(String name) async {
    try {
      if (name.isEmpty) {
        throw GameInitializationError('Pet name cannot be empty');
      }

      final defaultStats = PetStats(
        health: maxStat,
        happiness: maxStat,
        energy: maxStat,
      );

      final pet = await _repository.createPet(name);

      // Verify pet creation was successful
      if (pet == null || pet.stats == null) {
        throw GameInitializationError('Failed to initialize pet data');
      }

      return pet;
    } catch (e) {
      throw GameInitializationError('Failed to create pet: ${e.toString()}');
    }
  }

  Future<void> feedPet() async {
    if (!hasPet) {
      throw GameInitializationError('No active pet found');
    }

    try {
      final currentStats = currentPet!.stats;
      final newStats = currentStats.copyWith(
        health: _calculateNewStatValue(currentStats.health + statChangeAmount),
        energy: _calculateNewStatValue(currentStats.energy + statChangeAmount),
      );

      await _repository.updatePetStats(newStats);
    } catch (e) {
      throw GameInitializationError('Failed to feed pet: ${e.toString()}');
    }
  }

  Future<void> playWithPet() async {
    if (!hasPet) {
      throw GameInitializationError('No active pet found');
    }

    try {
      final currentStats = currentPet!.stats;
      final newStats = currentStats.copyWith(
        happiness:
            _calculateNewStatValue(currentStats.happiness + statChangeAmount),
        energy: _calculateNewStatValue(currentStats.energy - statChangeAmount),
      );

      await _repository.updatePetStats(newStats);
    } catch (e) {
      throw GameInitializationError('Failed to play with pet: ${e.toString()}');
    }
  }

  Future<void> cleanPet() async {
    if (!hasPet) {
      throw GameInitializationError('No active pet found');
    }

    try {
      final currentStats = currentPet!.stats;
      final newStats = currentStats.copyWith(
        health: _calculateNewStatValue(currentStats.health + statChangeAmount),
        happiness:
            _calculateNewStatValue(currentStats.happiness + statChangeAmount),
      );

      await _repository.updatePetStats(newStats);
    } catch (e) {
      throw GameInitializationError('Failed to clean pet: ${e.toString()}');
    }
  }

  Future<void> verifyPetState() async {
    if (!hasPet) return;

    try {
      final pet = currentPet;
      if (pet == null ||
          pet.stats == null ||
          pet.name.isEmpty ||
          pet.birthday == null) {
        throw GameInitializationError('Invalid pet state detected');
      }
    } catch (e) {
      throw GameInitializationError(
          'Failed to verify pet state: ${e.toString()}');
    }
  }

  int _calculateNewStatValue(int value) {
    if (value > maxStat) return maxStat;
    if (value < minStat) return minStat;
    return value;
  }
}
