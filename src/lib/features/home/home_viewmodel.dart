import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tamagotchi_stev/app/app.locator.dart';
import 'package:tamagotchi_stev/services/pet_service.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _petService = locator<PetService>();
  final _dialogService = locator<DialogService>();

  bool get hasPet => _petService.hasPet;

  Future<void> navigateToPet() async {
    setBusy(true);
    try {
      await _petService.verifyPetState();
      await _navigationService.navigateTo('/pet-view');
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        buttonTitle: 'OK',
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> startNewGame() async {
    setBusy(true);
    try {
      final response = await _dialogService.showDialog(
        title: 'Welcome to TamagotchiStev!',
        description: 'Choose a name for your new virtual pet!',
        barrierDismissible: true,
        dialogPlatform: DialogPlatform.Material,
      );

      if (response?.confirmed == true && response?.data != null) {
        final petName = response!.data as String;
        if (petName.trim().isNotEmpty) {
          await _petService.createPet(petName);
          await _navigationService.navigateTo('/pet-view');
        }
      }
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        buttonTitle: 'OK',
      );
    } finally {
      setBusy(false);
    }
  }
}
