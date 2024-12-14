import 'package:flutter/material.dart';
import 'package:tamagotchi_stev/app/app.bottomsheets.dart';
import 'package:tamagotchi_stev/app/app.dialogs.dart';
import 'package:tamagotchi_stev/app/app.locator.dart';
import 'package:tamagotchi_stev/app/app.router.dart';
import 'package:tamagotchi_stev/features/app/app_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  
  runApp(const AppView());
}