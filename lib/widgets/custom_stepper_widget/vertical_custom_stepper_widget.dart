import 'package:flutter/material.dart';
import 'package:universal_stepper/universal_stepper.dart';

import '../../utils/dashed_lined_painter.dart';

class VerticalCustomStepperWidget extends StatelessWidget {
  final bool inverted;
  final Axis stepperDirection;
  final List<String> titles;
  final List<String> subtitles;
  final int elementCount;
  final Color dashedLineColor;
  final Color containerColor;
  final Color borderColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final Color activeBadgeColor;
  final Color inactiveBadgeColor;
  final Color activeBorderColor;
  final Color inactiveBorderColor;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final Color activeSubtitleColor;
  final Color inactiveSubtitleColor;
  final int currentStep;
  final List<IconData> stepIcons;
  final StepperBadgePosition badgePosition;

  const VerticalCustomStepperWidget({
    super.key,
    required this.inverted,
    required this.stepperDirection,
    required this.titles,
    required this.subtitles,
    required this.elementCount,
    required this.dashedLineColor,
    required this.containerColor,
    required this.borderColor,
    required this.activeIconColor,
    required this.inactiveIconColor,
    required this.activeBadgeColor,
    required this.inactiveBadgeColor,
    required this.activeBorderColor,
    required this.inactiveBorderColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
    required this.activeSubtitleColor,
    required this.inactiveSubtitleColor,
    required this.currentStep,
    required this.stepIcons,
    this.badgePosition = StepperBadgePosition.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: UniversalStepper(
        inverted: inverted,
        stepperDirection: stepperDirection,
        elementBuilder: (context, index) {
          return Expanded(
            child: Container(
              padding: badgePosition == StepperBadgePosition.center
                  ? const EdgeInsets.all(15)
                  : badgePosition == StepperBadgePosition.start
                      ? const EdgeInsets.only(left: 15, bottom: 15)
                      : const EdgeInsets.only(left: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: badgePosition == StepperBadgePosition.center
                    ? MainAxisAlignment.center
                    : badgePosition == StepperBadgePosition.start
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                children: [
                  Text(
                    titles[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: index <= currentStep
                          ? activeTextColor
                          : inactiveTextColor,
                      fontSize: 16,
                    ),
                  ),
                  if (subtitles[index].isNotEmpty)
                    Text(
                      subtitles[index],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: index <= currentStep
                            ? activeSubtitleColor
                            : inactiveSubtitleColor,
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
        badgeBuilder: (context, index) {
          return Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color:
                  index <= currentStep ? activeBadgeColor : inactiveBadgeColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: index <= currentStep
                    ? activeBorderColor
                    : inactiveBorderColor,
                width: 1,
              ),
            ),
            child: Icon(
              stepIcons[index],
              color: index <= currentStep ? activeIconColor : inactiveIconColor,
            ),
          );
        },
        pathBuilder: (context, index) {
          return badgePosition == StepperBadgePosition.center
              ? CustomPaint(
                  painter: DashedLinePainter(
                    color: index == 0
                        ? Colors.transparent
                        : (index <= currentStep
                            ? dashedLineColor
                            : dashedLineColor.withOpacity(0.20)),
                  ),
                  child: const SizedBox(
                    width: 4,
                    height: double.infinity,
                  ),
                )
              : badgePosition == StepperBadgePosition.start
                  ? CustomPaint(
                      painter: DashedLinePainter(
                        color: index == elementCount - 1
                            ? Colors.transparent
                            : (index < currentStep
                                ? dashedLineColor
                                : dashedLineColor.withOpacity(0.20)),
                      ),
                      child: const SizedBox(
                        width: 4,
                        height: double.infinity,
                      ),
                    )
                  : CustomPaint(
                      painter: DashedLinePainter(
                        color: (index < currentStep
                            ? dashedLineColor
                            : dashedLineColor.withOpacity(0.20)),
                      ),
                      child: const SizedBox(
                        width: 4,
                        height: double.infinity,
                      ),
                    );
        },
        subPathBuilder: (context, index) {
          return CustomPaint(
            painter: DashedLinePainter(
              color: index == elementCount - 1
                  ? Colors.transparent
                  : (index < currentStep
                      ? dashedLineColor
                      : dashedLineColor.withOpacity(0.20)),
            ),
            child: const SizedBox(
              width: 4,
              height: double.infinity,
            ),
          );
        },
        elementCount: elementCount,
        badgePosition: badgePosition,
      ),
    );
  }
}
