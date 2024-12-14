import 'package:stacked_services/stacked_services.dart';
import 'package:tamagotchi_stev/app/app.locator.dart';
import 'package:tamagotchi_stev/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tamagotchi_stev/ui/dialogs/name_pet/name_pet_dialog.dart';
import 'package:tamagotchi_stev/ui/dialogs/pet_status/pet_status_dialog.dart';
import 'package:tamagotchi_stev/ui/dialogs/error_retry/error_retry_dialog.dart';

enum DialogType {
  infoAlert,
  namePet,
  petStatus,
  errorRetry,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.infoAlert: (context, DialogRequest<dynamic> request,
            Function(DialogResponse<dynamic>) completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.namePet: (context, DialogRequest<dynamic> request,
            Function(DialogResponse<dynamic>) completer) =>
        NamePetDialog(request: request, completer: completer),
    DialogType.petStatus: (context, DialogRequest<dynamic> request,
            Function(DialogResponse<dynamic>) completer) =>
        PetStatusDialog(request: request, completer: completer),
    DialogType.errorRetry: (context, DialogRequest<dynamic> request,
            Function(DialogResponse<dynamic>) completer) =>
        ErrorRetryDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
