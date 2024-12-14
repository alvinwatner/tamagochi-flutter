import 'package:stacked_services/stacked_services.dart';
import 'package:tamagotchi_stev/app/app.locator.dart';
import 'package:tamagotchi_stev/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tamagotchi_stev/ui/dialogs/name_pet/name_pet_dialog.dart';
import 'package:tamagotchi_stev/ui/dialogs/pet_status/pet_status_dialog.dart';
import 'package:tamagotchi_stev/core/enums/dialog_type.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.infoAlert: (context, DialogRequest request, Function(DialogResponse) completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.namePet: (context, DialogRequest request, Function(DialogResponse) completer) =>
        NamePetDialog(request: request, completer: completer),
    DialogType.petStatus: (context, DialogRequest request, Function(DialogResponse) completer) =>
        PetStatusDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}