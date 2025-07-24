import 'package:flutter/material.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

import '../../../constants/app_strings.dart';

class NotificationBottomSheetWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;
  final VoidCallback buttonOnPressed;

  const NotificationBottomSheetWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.buttonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 4,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  color: AppColors.contentSecondaryLight.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          const SpaceWidget(spaceHeight: 32),
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: IconWidget(
              icon: icon,
              width: 40,
              height: 40,
              color: AppColors.mainBrandColor,
            ),
          ),
          const SpaceWidget(spaceHeight: 12),
          TextWidget(
            text: title,
            fontColor: AppColors.contentPrimaryLight,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          const SpaceWidget(spaceHeight: 12),
          TextWidget(
            text: desc,
            fontColor: AppColors.contentSecondaryLight,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlignment: TextAlign.start,
          ),
          const SpaceWidget(spaceHeight: 32),
          ButtonWidget(
            onPressed: buttonOnPressed,
            label: AppStrings.eventDetails,
            buttonWidth: double.infinity,
          ),
        ],
      ),
    );
  }
}
