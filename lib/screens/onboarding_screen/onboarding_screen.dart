import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/onboarding_screen/widgets/onboarding_content.dart';

import '../../constants/app_colors.dart';
import '../../utils/app_size.dart';
import '../../widgets/button_widget/button_widget.dart';
import '../../widgets/image_widget/image_widget.dart';
import '../../widgets/space_widget/space_widget.dart';
import '../../widgets/text_button_widget/text_button_widget.dart';
import '../../widgets/text_widget/text_widgets.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import 'controller/onboarding_screen_controller.dart';

class OnboardingScreen extends GetView<OnboardingScreenController> {
  OnboardingScreen({super.key}) {
    Get.put(OnboardingScreenController());
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.thirdBrandColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.updateIndex,
                itemCount: contents.length,
                itemBuilder: (_, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(32),
                        ),
                        child: ImageWidget(
                          imagePath: contents[i].image,
                          height: ResponsiveUtils.height(500),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 48),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextWidget(
                          text: contents[i].title,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontColor: AppColors.contentPrimaryLight,
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextWidget(
                          text: contents[i].description,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontColor: AppColors.contentSecondaryLight,
                          textAlignment: TextAlign.left,
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ButtonWidget(
                          onPressed: () {
                            controller.goToNextPage(context,
                                totalPages: contents.length);
                          },
                          label: controller.currentIndex.value ==
                                  contents.length - 1
                              ? AppStrings.next.tr
                              : AppStrings.next.tr,
                          textColor: AppColors.white,
                          fontSize: 16,
                          buttonWidth: double.infinity,
                          buttonHeight: 56,
                          buttonRadius: BorderRadius.circular(100),
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 12),
                      Center(
                        child: TextButtonWidget(
                          onPressed: () {
                            Get.offAll(const BottomNavScreen());
                          },
                          text: AppStrings.skip.tr,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.mainBrandColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.mainBrandColor,
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 5),
                    ],
                  );
                },
              ),
            ),
            Positioned(
              top: ResponsiveUtils.height(470),
              child: GetX<OnboardingScreenController>(
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => _buildDot(index, controller),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index, OnboardingScreenController controller) {
    return Container(
      height: ResponsiveUtils.height(8),
      margin: const EdgeInsets.all(3),
      width: controller.currentIndex.value == index
          ? ResponsiveUtils.width(23)
          : ResponsiveUtils.width(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: controller.currentIndex.value == index
            ? AppColors.white
            : AppColors.white.withOpacity(0.6),
      ),
    );
  }
}
