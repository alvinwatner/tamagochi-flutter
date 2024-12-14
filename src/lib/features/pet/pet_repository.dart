import 'package:tamagotchi_stev/models/pet_model.dart';
import 'package:tamagotchi_stev/models/pet_stats_model.dart';

class PetRepository {
  Pet? _currentPet;

  Pet? get currentPet => _currentPet;

  Future<Pet> createPet(String name) async {
    final pet = Pet(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      birthday: DateTime.now(),
      stats: const PetStats(
        health: 100,
        happiness: 100,
        energy: 100,
      ),
    );
    _currentPet = pet;
    return pet;
  }

  Future<void> updatePetStats(PetStats newStats) async {
    if (_currentPet != null) {
      _currentPet = _currentPet!.copyWith(stats: newStats);
    }
  }

  Future<void> savePet(Pet pet) async {
    _currentPet = pet;
  }
}
