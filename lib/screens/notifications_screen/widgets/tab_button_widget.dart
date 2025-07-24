import 'package:flutter/material.dart';
import 'package:trackdays_planner/constants/app_colors.dart';

class TabButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final Color textSelectedColor;
  final Color textUnselectedColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final double borderWidth;

  const TabButtonWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.selectedColor = AppColors.mainBrandColor,
    this.unselectedColor = AppColors.secondBrandColor,
    this.textSelectedColor = AppColors.contentPrimaryLight,
    this.textUnselectedColor = AppColors.contentSecondaryLight,
    this.horizontalPadding = 24,
    this.verticalPadding = 8,
    this.borderRadius = 20,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isSelected ? selectedColor : unselectedColor,
            width: borderWidth,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? textSelectedColor : textUnselectedColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
