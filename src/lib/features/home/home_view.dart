import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:tamagotchi_stev/theme/custom_colors.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'TamagotchiStev',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.primary,
                  ),
                ),
                const Gap(8),
                const Text(
                  'Your Virtual Pet Adventure!',
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomColors.textSecondary,
                  ),
                ),
                const Gap(40),
                Image.asset(
                  'assets/images/steve.png',
                  width: 200,
                  height: 200,
                ),
                const Gap(40),
                if (viewModel.isBusy)
                  const CircularProgressIndicator()
                else if (viewModel.hasPet)
                  ElevatedButton(
                    onPressed: viewModel.navigateToPet,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      'Continue Playing',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                else
                  ElevatedButton(
                    onPressed: viewModel.startNewGame,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      'Start New Game',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
