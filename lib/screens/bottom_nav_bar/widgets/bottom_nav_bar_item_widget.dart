import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/app_size.dart';
import '../../../widgets/image_widget/image_widget.dart';

class BottomNavBarItemWidget extends BottomNavigationBarItem {
  BottomNavBarItemWidget({
    required String icon,
    required String label,
    required bool isSelected,
  }) : super(
          icon: ImageWidget(
            imagePath: icon,
            height: ResponsiveUtils.width(24),
            width: ResponsiveUtils.width(24),
            color: isSelected
                ? AppColors.mainBrandColor
                : AppColors.contentSecondaryLight,
          ),
          label: label,
        );
}
