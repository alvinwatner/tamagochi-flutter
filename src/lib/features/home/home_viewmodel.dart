import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tamagotchi_stev/app/app.locator.dart';
import 'package:tamagotchi_stev/app/app.router.dart';
import 'package:tamagotchi_stev/services/pet_service.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _petService = locator<PetService>();

  bool get hasPet => _petService.hasPet;

  Future<void> navigateToPet() async {
    await _navigationService.navigateTo(Routes.petView);
  }

  Future<void> startNewGame() async {
    await _navigationService.navigateTo(Routes.petView);
  }
}
