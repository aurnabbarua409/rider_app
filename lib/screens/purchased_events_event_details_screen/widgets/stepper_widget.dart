import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class StepperWidget extends StatelessWidget {
  final int activeStep;
  final Function(int) onStepReached;
  final List<IconData> stepIcons;
  final List<IconData> activeStepIcons;
  final List<IconData> finishedStepIcons;
  final List<String> stepTitles; // Add titles list

  final VoidCallback? viewDetailsOnPressed;
  final VoidCallback? fillFormOnPressed;

  const StepperWidget({
    super.key,
    required this.activeStep,
    required this.onStepReached,
    required this.stepIcons,
    required this.activeStepIcons,
    required this.finishedStepIcons,
    required this.stepTitles, // Make titles required
    this.viewDetailsOnPressed,
    this.fillFormOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stepper on the left
        EasyStepper(
          activeStep: activeStep,
          lineStyle: LineStyle(
            lineLength: 20,
            lineSpace: 1,

            // Reduced from 10 to decrease spacing
            lineThickness: 1,
            lineType: LineType.dotted,
            defaultLineColor: AppColors.mainBrandColor.withOpacity(0.3),
            activeLineColor: AppColors.mainBrandColor,
            finishedLineColor: AppColors.mainBrandColor,
            progress: 0,
          ),
          stepShape: StepShape.rRectangle,
          direction: Axis.vertical,
          stepBorderRadius: 10,
          borderThickness: 2,
          padding: EdgeInsets.zero,
          // Changed to zero to minimize spacing
          stepRadius: 20,
          // Reduced from 25 to make steps smaller
          finishedStepBackgroundColor: AppColors.mainBrandColor,
          activeStepBackgroundColor: AppColors.white,
          unreachedStepBackgroundColor: AppColors.white,
          activeStepBorderColor: AppColors.mainBrandColor,
          unreachedStepBorderColor: AppColors.contentSecondaryLight,
          finishedStepBorderColor: AppColors.mainBrandColor,
          steps: List.generate(
            stepIcons.length,
            (index) => EasyStep(
              icon: Icon(stepIcons[index], color: AppColors.grey),
              activeIcon:
                  Icon(activeStepIcons[index], color: AppColors.mainBrandColor),
              finishIcon:
                  Icon(finishedStepIcons[index], color: AppColors.white),
            ),
          ),
          onStepReached: onStepReached,
        ),

        // Titles on the right
        const SizedBox(width: 16), // Add some spacing
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            // Adjusted to align with smaller steps
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                stepTitles.length,
                (index) => Container(
                  height: 50,
                  // Reduced from 60 to match smaller step spacing
                  alignment: Alignment.centerLeft,
                  child: Text(
                    stepTitles[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: index == activeStep
                          ? FontWeight.w600
                          : index < activeStep
                              ? FontWeight.w500
                              : FontWeight.w400,
                      color: index == activeStep
                          ? AppColors.mainBrandColor
                          : index < activeStep
                              ? AppColors.mainBrandColor
                              : AppColors.contentSecondaryLight,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
