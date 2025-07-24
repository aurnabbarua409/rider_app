import 'package:flutter/material.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class DateBadgeWidget extends StatelessWidget {
  final String month;
  final String date;
  final String day;
  final double width;

  const DateBadgeWidget({
    super.key,
    required this.month,
    required this.date,
    required this.day,
    this.width = 72,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtils.width(width),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.secondBrandColor),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.mainBrandColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(6)),
              border: Border.all(color: AppColors.secondBrandColor),
            ),
            child: TextWidget(
              text: month,
              fontColor: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Column(
              children: [
                TextWidget(
                  text: date,
                  fontColor: AppColors.contentPrimaryLight,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
                TextWidget(
                  text: day,
                  fontColor: AppColors.contentPrimaryLight.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
