import 'package:tamagotchi_stev/core/error/game_initialization_error.dart';
import 'package:tamagotchi_stev/models/pet_model.dart';
import 'package:tamagotchi_stev/models/pet_stats_model.dart';

class PetRepository {
  Pet? _currentPet;

  Pet? get currentPet => _currentPet;

  Future<Pet> createPet(String name) async {
    try {
      if (name.trim().isEmpty) {
        throw GameInitializationError('Pet name cannot be empty');
      }

      final pet = Pet(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name.trim(),
        birthday: DateTime.now(),
        stats: const PetStats(
          health: 100,
          happiness: 100,
          energy: 100,
        ),
      );

      await savePet(pet);
      return pet;
    } catch (e) {
      throw GameInitializationError('Failed to create pet: ${e.toString()}');
    }
  }

  Future<void> updatePetStats(PetStats newStats) async {
    try {
      if (_currentPet == null) {
        throw GameInitializationError('No active pet found');
      }

      _currentPet = _currentPet!.copyWith(stats: newStats);
    } catch (e) {
      throw GameInitializationError(
          'Failed to update pet stats: ${e.toString()}');
    }
  }

  Future<void> savePet(Pet pet) async {
    try {
      _currentPet = pet;
    } catch (e) {
      throw GameInitializationError('Failed to save pet: ${e.toString()}');
    }
  }

  Future<void> deletePet() async {
    try {
      _currentPet = null;
    } catch (e) {
      throw GameInitializationError('Failed to delete pet: ${e.toString()}');
    }
  }
}
