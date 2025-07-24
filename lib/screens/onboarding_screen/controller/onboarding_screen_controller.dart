import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/routes/app_routes.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/space_widget/space_widget.dart';
import '../../../widgets/text_button_widget/text_button_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';
import '../../bottom_nav_bar/bottom_nav_bar.dart';

class OnboardingScreenController extends GetxController {
  // Observable variable for the current page index
  RxInt currentIndex = 0.obs;

  // PageController for the PageView
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Function to update the current index
  void updateIndex(int index) {
    currentIndex.value = index;
  }

  // Function to navigate to the next page
  void goToNextPage(BuildContext context, {int totalPages = 3}) {
    if (currentIndex.value < totalPages - 1) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Show bottom sheet when onboarding ends
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        backgroundColor: AppColors.white,
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: ResponsiveUtils.width(90),
                  height: ResponsiveUtils.height(4),
                  decoration: BoxDecoration(
                    color: AppColors.contentPrimaryLight.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              const SpaceWidget(spaceHeight: 32),
              TextWidget(
                text: AppStrings.welcome.tr,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontColor: AppColors.contentPrimaryLight,
                textAlignment: TextAlign.left,
              ),
              const SpaceWidget(spaceHeight: 12),
              TextWidget(
                text: AppStrings.onboardingDescription.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontColor: AppColors.contentSecondaryLight,
                textAlignment: TextAlign.left,
              ),
              const SpaceWidget(spaceHeight: 12),
              ButtonWidget(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                  Get.offAll(const BottomNavScreen());
                },
                label: AppStrings.explore.tr,
                buttonWidth: double.infinity,
              ),
              const SpaceWidget(spaceHeight: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ButtonWidget(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                        Get.toNamed(AppRoutes.registerScreen);
                      },
                      label: AppStrings.register.tr,
                      buttonWidth: 196,
                      backgroundColor: AppColors.white,
                      textColor: AppColors.mainBrandColor,
                      borderColor: AppColors.mainBrandColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButtonWidget(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                        Get.toNamed(AppRoutes.loginScreen);
                      },
                      text: AppStrings.login.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.mainBrandColor,
                    ),
                  ),
                ],
              ),
              const SpaceWidget(spaceHeight: 8),
            ],
          ),
        ),
      );
    }
  }
}
