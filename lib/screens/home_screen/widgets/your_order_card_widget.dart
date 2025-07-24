import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/button_widget/button_widget.dart';
import '../../../widgets/image_widget/image_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class YourOrderCardWidget extends StatelessWidget {
  final String location;
  final List<String> orderImages;
  final int activeStep;
  final Function(int) onStepReached;
  final double totalPrice;
  final List<IconData> stepIcons;
  final List<IconData> activeStepIcons;
  final List<IconData> finishedStepIcons;
  final VoidCallback onPressed;

  const YourOrderCardWidget({
    super.key,
    required this.location,
    required this.orderImages,
    required this.activeStep,
    required this.onStepReached,
    required this.totalPrice,
    required this.stepIcons,
    required this.activeStepIcons,
    required this.finishedStepIcons,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.contentPrimaryLight.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              TextWidget(
                text: AppStrings.sendOrder.tr,
                fontColor: AppColors.contentSecondaryLight.withOpacity(0.5),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              const SpaceWidget(spaceWidth: 12),
              TextWidget(
                text: location,
                fontColor: AppColors.contentPrimaryLight,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ],
          ),
          const SpaceWidget(spaceHeight: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                // First two images
                ...List.generate(
                  orderImages.length >= 2 ? 2 : orderImages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ImageWidget(
                      height: 100,
                      width: 100,
                      imagePath: orderImages[index],
                    ),
                  ),
                ),
                // Text showing remaining images
                if (orderImages.length > 2)
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.greyLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.contentPrimaryLight.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: "+${orderImages.length - 2}",
                        fontColor: AppColors.contentTertiaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SpaceWidget(spaceHeight: 16),
          Row(
            children: [
              Row(
                children: [
                  TextWidget(
                    text: orderImages.length.toString(),
                    fontColor: AppColors.contentPrimaryLight,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  const SpaceWidget(spaceWidth: 4),
                  TextWidget(
                    text: AppStrings.items.tr,
                    fontColor: AppColors.contentSecondaryLight.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ],
              ),
              const SpaceWidget(spaceWidth: 24),
              Row(
                children: [
                  TextWidget(
                    text: "€${totalPrice.toStringAsFixed(2)}",
                    fontColor: AppColors.contentPrimaryLight,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  const SpaceWidget(spaceWidth: 4),
                  TextWidget(
                    text: AppStrings.totalPrice.tr,
                    fontColor: AppColors.contentSecondaryLight.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ],
              ),
            ],
          ),
          const SpaceWidget(spaceHeight: 16),
          SizedBox(
            height: 80,
            child: EasyStepper(
              activeStep: activeStep,
              showLoadingAnimation: false,
              enableStepTapping: false,
              lineStyle: LineStyle(
                lineLength: 50,
                lineThickness: 2,
                lineType: LineType.dotted,
                defaultLineColor: AppColors.mainBrandColor.withOpacity(0.3),
                activeLineColor: AppColors.mainBrandColor,
                finishedLineColor: AppColors.mainBrandColor,
                progress: 0.5,
              ),
              stepShape: StepShape.rRectangle,
              stepBorderRadius: 10,
              borderThickness: 2,
              padding: const EdgeInsets.all(5),
              stepRadius: 25,
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
                  activeIcon: Icon(activeStepIcons[index],
                      color: AppColors.mainBrandColor),
                  finishIcon:
                      Icon(finishedStepIcons[index], color: AppColors.white),
                ),
              ),
              onStepReached: onStepReached,
            ),
          ),
          const SpaceWidget(spaceHeight: 16),
          ButtonWidget(
            onPressed: onPressed,
            label: AppStrings.viewOrderDetails,
          ),
        ],
      ),
    );
  }
}
