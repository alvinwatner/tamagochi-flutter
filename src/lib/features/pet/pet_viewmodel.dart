import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tamagotchi_stev/app/app.locator.dart';
import 'package:tamagotchi_stev/models/pet_model.dart';
import 'package:tamagotchi_stev/services/pet_service.dart';

class PetViewModel extends BaseViewModel {
  final _petService = locator<PetService>();
  final _dialogService = locator<DialogService>();

  Pet? get _pet => _petService.currentPet;

  String get petName => _pet?.name ?? 'Pet';
  int get health => _pet?.stats.health ?? 0;
  int get happiness => _pet?.stats.happiness ?? 0;
  int get energy => _pet?.stats.energy ?? 0;
  String get petState => _determinePetState();

  Future<void> initialize() async {
    if (_pet == null) {
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.namePet,
        title: 'Name Your Pet',
        description: 'Choose a name for your new friend!',
      );

      if (response?.confirmed == true && response?.data != null) {
        await _petService.createPet(response!.data);
        rebuildUi();
      }
    }
  }

  Future<void> feedPet() async {
    await _petService.feedPet();
    rebuildUi();
  }

  Future<void> playWithPet() async {
    await _petService.playWithPet();
    rebuildUi();
  }

  Future<void> cleanPet() async {
    await _petService.cleanPet();
    rebuildUi();
  }

  Future<void> showPetStatus() async {
    if (_pet != null) {
      await _dialogService.showCustomDialog(
        variant: DialogType.petStatus,
        data: _pet,
      );
    }
  }

  String _determinePetState() {
    if (_pet == null) return 'idle';
    if (energy < 30) return 'tired';
    if (happiness < 30) return 'sad';
    if (health < 30) return 'sick';
    return 'happy';
  }
}
