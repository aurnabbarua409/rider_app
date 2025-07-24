import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/language_selection_screen/widgets/language_selection_card.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

import 'controller/language_selection_controller.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final LanguageSelectionController controller =
      Get.put(LanguageSelectionController());

  LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceWidget(spaceHeight: 36),
              TextWidget(
                text: AppStrings.selectLanguage.tr,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontColor: AppColors.contentPrimaryLight,
              ),
              const SpaceWidget(spaceHeight: 32),
              Obx(() => LanguageSelectionCard(
                    language: AppStrings.english.tr,
                    flagImage: AppImagePath.englishFlag,
                    selectedLanguage: controller.selectedLanguage.value,
                    onLanguageChanged: controller.onLanguageChanged,
                  )),
              Obx(() => LanguageSelectionCard(
                    language: AppStrings.spanish.tr,
                    flagImage: AppImagePath.spanishFlag,
                    selectedLanguage: controller.selectedLanguage.value,
                    onLanguageChanged: controller.onLanguageChanged,
                  )),
              Obx(() => LanguageSelectionCard(
                    language: AppStrings.french.tr,
                    flagImage: AppImagePath.frenchFlag,
                    selectedLanguage: controller.selectedLanguage.value,
                    onLanguageChanged: controller.onLanguageChanged,
                  )),
              Obx(() => LanguageSelectionCard(
                    language: AppStrings.german.tr,
                    flagImage: AppImagePath.germanFlag,
                    selectedLanguage: controller.selectedLanguage.value,
                    onLanguageChanged: controller.onLanguageChanged,
                  )),
              Obx(() => LanguageSelectionCard(
                    language: AppStrings.dutch.tr,
                    flagImage: AppImagePath.dutchFlag,
                    selectedLanguage: controller.selectedLanguage.value,
                    onLanguageChanged: controller.onLanguageChanged,
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ButtonWidget(
          onPressed: controller.submit,
          label: AppStrings.submit,
          buttonWidth: double.infinity,
          buttonHeight: 56,
        ),
      ),
    );
  }
}
