import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/space_widget/space_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class StatWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const StatWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.red50.withOpacity(0.8),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.mainBrandColor,
          ),
          const SpaceWidget(spaceWidth: 4),
          TextWidget(
            text: text,
            fontColor: AppColors.contentPrimaryLight,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
