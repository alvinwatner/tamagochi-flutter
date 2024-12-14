import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tamagotchi_stev/app/app.locator.dart';
import 'package:tamagotchi_stev/core/enums/dialog_type.dart';
import 'package:tamagotchi_stev/core/error/game_initialization_error.dart';
import 'package:tamagotchi_stev/models/pet_model.dart';
import 'package:tamagotchi_stev/services/pet_service.dart';

class PetViewModel extends BaseViewModel {
  final _petService = locator<PetService>();
  final _dialogService = locator<DialogService>();

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Pet? get _pet => _petService.currentPet;

  String get petName => _pet?.name ?? 'Pet';
  int get health => _pet?.stats.health ?? 0;
  int get happiness => _pet?.stats.happiness ?? 0;
  int get energy => _pet?.stats.energy ?? 0;
  String get petState => _determinePetState();

  Future<void> initialize() async {
    try {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      await _petService.verifyPetState();

      if (_pet == null) {
        final response = await _dialogService.showCustomDialog(
          variant: DialogType.namePet,
          title: 'Name Your Pet',
          description: 'Choose a name for your new friend!',
          barrierDismissible: false,
        );

        if (response?.confirmed == true && response?.data != null) {
          final petName = response!.data as String;
          if (petName.trim().isNotEmpty) {
            await _petService.createPet(petName);
          } else {
            throw GameInitializationError('Pet name cannot be empty');
          }
        } else {
          throw GameInitializationError('Pet creation cancelled by user');
        }
      }

      _isLoading = false;
      _errorMessage = '';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();

      await _showErrorDialog();
    }
  }

  Future<void> retryInitialization() async {
    await initialize();
  }

  Future<void> feedPet() async {
    try {
      await runBusyFuture(_petService.feedPet());
      notifyListeners();
    } catch (e) {
      await _showErrorDialog();
    }
  }

  Future<void> playWithPet() async {
    try {
      await runBusyFuture(_petService.playWithPet());
      notifyListeners();
    } catch (e) {
      await _showErrorDialog();
    }
  }

  Future<void> cleanPet() async {
    try {
      await runBusyFuture(_petService.cleanPet());
      notifyListeners();
    } catch (e) {
      await _showErrorDialog();
    }
  }

  Future<void> showPetStatus() async {
    if (_pet != null) {
      await _dialogService.showCustomDialog(
        variant: DialogType.petStatus,
        title: '${_pet!.name}\'s Status',
        description: 'Health: ${_pet!.stats.health}%\n'
            'Happiness: ${_pet!.stats.happiness}%\n'
            'Energy: ${_pet!.stats.energy}%',
        data: _pet,
      );
    }
  }

  Future<void> _showErrorDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.errorRetry,
      title: 'Error',
      description: _errorMessage,
      data: retryInitialization,
    );
  }

  String _determinePetState() {
    if (_pet == null) return 'idle';
    if (energy < 30) return 'tired';
    if (happiness < 30) return 'sad';
    if (health < 30) return 'sick';
    return 'happy';
  }
}
