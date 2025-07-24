import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/image_widget/image_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';

class BrowseAllEventsWidget extends StatelessWidget {
  final String imagePath;
  final String month;
  final String day;
  final String weekday;
  final String eventName;
  final String location;
  final String time;
  final String temperature;
  final String laps;
  final String price;
  final String badgeText;
  final Color badgeTextColor;
  final Color badgeTextBgColor;
  final VoidCallback onPressed;

  const BrowseAllEventsWidget({
    super.key,
    required this.imagePath,
    required this.month,
    required this.day,
    required this.weekday,
    required this.eventName,
    required this.location,
    required this.time,
    required this.temperature,
    required this.laps,
    required this.price,
    required this.badgeText,
    required this.badgeTextColor,
    required this.badgeTextBgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.contentPrimaryLight.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Date Overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageWidget(
                  imagePath: imagePath,
                  height: ResponsiveUtils.height(227),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  width: ResponsiveUtils.width(72),
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
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(6)),
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
                              text: day,
                              fontColor: AppColors.contentPrimaryLight,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                            TextWidget(
                              text: weekday,
                              fontColor: AppColors.contentPrimaryLight
                                  .withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SpaceWidget(spaceHeight: 16),
          // Event Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: ResponsiveUtils.width(200),
                    child: TextWidget(
                      text: eventName,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontColor: AppColors.contentPrimaryLight,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlignment: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeTextBgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextWidget(
                      text: badgeText,
                      fontColor: badgeTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SpaceWidget(spaceHeight: 8),
              TextWidget(
                text: location,
                fontColor: AppColors.contentPrimaryLight.withOpacity(0.5),
                fontSize: 14,
              ),
              const SpaceWidget(spaceHeight: 12),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 16,
                    color: AppColors.mainBrandColor,
                  ),
                  const SpaceWidget(spaceWidth: 4),
                  TextWidget(
                    text: time,
                    fontColor: AppColors.contentPrimaryLight,
                    fontSize: 14,
                  ),
                  const SpaceWidget(spaceWidth: 16),
                  const Icon(
                    Icons.device_thermostat_outlined,
                    size: 16,
                    color: AppColors.mainBrandColor,
                  ),
                  const SpaceWidget(spaceWidth: 4),
                  TextWidget(
                    text: temperature,
                    fontColor: AppColors.contentPrimaryLight,
                    fontSize: 14,
                  ),
                  const SpaceWidget(spaceWidth: 16),
                  const Icon(
                    Icons.loop,
                    size: 16,
                    color: AppColors.mainBrandColor,
                  ),
                  const SpaceWidget(spaceWidth: 4),
                  TextWidget(
                    text: laps,
                    fontColor: AppColors.contentPrimaryLight,
                    fontSize: 14,
                  ),
                ],
              ),
              const SpaceWidget(spaceHeight: 12),
              Divider(
                color: AppColors.contentPrimaryLight.withOpacity(0.1),
              ),
              const SpaceWidget(spaceHeight: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: price,
                    fontColor: AppColors.contentPrimaryLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  ButtonWidget(
                    onPressed: onPressed,
                    label: AppStrings.viewDetails.tr,
                    buttonWidth: ResponsiveUtils.width(143),
                    buttonHeight: 45,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.mainBrandColor,
                    borderColor: AppColors.mainBrandColor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
