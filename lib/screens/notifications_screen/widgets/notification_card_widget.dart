import 'package:flutter/material.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';

import '../../../widgets/icon_widget/icon_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class NotificationCardWidget extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String title;
  final String description;

  final Color containerColor;
  final Color fontColor;

  final VoidCallback onTap;

  const NotificationCardWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.containerColor,
    required this.fontColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.secondBrandColor,
              width: 1,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                color: iconColor,
                height: 24,
                width: 24,
              ),
            ),
            const SpaceWidget(spaceWidth: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  fontColor: fontColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                const SpaceWidget(spaceHeight: 4),
                SizedBox(
                  width: ResponsiveUtils.width(220),
                  child: TextWidget(
                    text: description,
                    fontColor: AppColors.contentSecondaryLight,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlignment: TextAlign.start,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
