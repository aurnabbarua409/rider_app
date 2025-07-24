import 'package:flutter/material.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_icon_path.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({super.key, required this.icon, required this.label});
  final String icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconWidget(height: 25, width: 25, icon: icon),
        const SpaceWidget(
          spaceWidth: 10,
        ),
        TextWidget(
          text: label,
          fontColor: AppColors.contentPrimaryLight,
          fontSize: 20,
        ),
        const Spacer(),
        const IconWidget(
          height: 15,
          width: 15,
          icon: AppIconPath.rightArrowIcon,
        )
      ],
    );
  }
}
