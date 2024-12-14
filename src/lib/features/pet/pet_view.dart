import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:gap/gap.dart';
import 'package:tamagotchi_stev/features/pet/widgets/pet_action_buttons.dart';
import 'package:tamagotchi_stev/features/pet/widgets/pet_animation_widget.dart';
import 'package:tamagotchi_stev/features/pet/widgets/pet_status_widget.dart';
import 'pet_viewmodel.dart';

class PetView extends StackedView<PetViewModel> {
  const PetView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PetViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.petName),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: viewModel.showPetStatus,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              PetStatusWidget(
                health: viewModel.health,
                happiness: viewModel.happiness,
                energy: viewModel.energy,
              ),
              const Gap(20),
              Expanded(
                child: PetAnimationWidget(
                  petState: viewModel.petState,
                ),
              ),
              const Gap(20),
              PetActionButtons(
                onFeed: viewModel.feedPet,
                onPlay: viewModel.playWithPet,
                onClean: viewModel.cleanPet,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  PetViewModel viewModelBuilder(BuildContext context) => PetViewModel();

  @override
  void onViewModelReady(PetViewModel viewModel) => viewModel.initialize();
}
