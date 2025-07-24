import 'package:flutter/material.dart';
import 'package:trackdays_planner/widgets/image_widget/image_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class LanguageSelectionCard extends StatelessWidget {
  final String language;
  final String flagImage;
  final String? selectedLanguage;
  final void Function(String) onLanguageChanged;

  const LanguageSelectionCard({
    super.key,
    required this.language,
    required this.flagImage,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greyLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: ImageWidget(
                  imagePath: flagImage,
                  width: 24,
                  height: 24,
                ),
              ),
              const SpaceWidget(spaceWidth: 8),
              TextWidget(
                text: language,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontColor: AppColors.contentPrimaryLight,
              ),
            ],
          ),
          Checkbox(
            value: selectedLanguage == language,
            onChanged: (bool? value) {
              if (value == true) {
                onLanguageChanged(language);
              }
            },
            activeColor: AppColors.mainBrandColor,
            checkColor: Colors.white,
            side: const BorderSide(
              color: AppColors.contentSecondaryLight,
              width: 2,
            ),
            shape: const CircleBorder(),
          ),
        ],
      ),
    );
  }
}
