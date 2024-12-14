import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:tamagotchi_stev/core/error/error_boundary_widget.dart';
import 'package:tamagotchi_stev/features/pet/widgets/loading_indicator_widget.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: ErrorBoundaryWidget(
        errorMessage: viewModel.errorMessage,
        onRetry: viewModel.retryStartup,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'TamagotchiStev',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              const Gap(20),
              const LoadingIndicatorWidget(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
