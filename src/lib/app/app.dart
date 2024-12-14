import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tamagotchi_stev/features/home/home_view.dart';
import 'package:tamagotchi_stev/features/pet/pet_view.dart';
import 'package:tamagotchi_stev/features/startup/startup_view.dart';
import 'package:tamagotchi_stev/services/pet_service.dart';
import 'package:tamagotchi_stev/ui/bottom_sheets/pet_actions/pet_actions_sheet.dart';
import 'package:tamagotchi_stev/ui/dialogs/name_pet/name_pet_dialog.dart';
import 'package:tamagotchi_stev/ui/dialogs/pet_status/pet_status_dialog.dart';
import 'package:tamagotchi_stev/ui/dialogs/error_retry/error_retry_dialog.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView, path: '/home-view'),
    MaterialRoute(page: PetView, path: '/pet-view'),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: PetService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: PetActionsSheet),
  ],
  dialogs: [
    StackedDialog(classType: NamePetDialog),
    StackedDialog(classType: PetStatusDialog),
    StackedDialog(classType: ErrorRetryDialog),
  ],
)
class App {}
