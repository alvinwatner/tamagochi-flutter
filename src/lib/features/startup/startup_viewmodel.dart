import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tamagotchi_stev/app/app.locator.dart';
import 'package:tamagotchi_stev/app/app.router.dart';
import 'package:tamagotchi_stev/core/error/game_initialization_error.dart';
import 'package:tamagotchi_stev/services/pet_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _petService = locator<PetService>();

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> runStartupLogic() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await _petService.verifyPetState();
      await _navigationService.replaceWithHomeView();
    } catch (e) {
      _errorMessage = e is GameInitializationError
          ? e.message
          : 'Failed to initialize game';
      notifyListeners();
    }
  }

  Future<void> retryStartup() async {
    _errorMessage = '';
    notifyListeners();
    await runStartupLogic();
  }
}
