import 'package:flutter/material.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/image_widget/image_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';

class ShopTopProductWidget extends StatelessWidget {
  final String imagePath;
  final String brandImagePath;
  final String eventName;
  final String location;
  final String price;
  final VoidCallback onPressed;

  const ShopTopProductWidget({
    super.key,
    required this.imagePath,
    required this.brandImagePath,
    required this.eventName,
    required this.location,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: ResponsiveUtils.width(195),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Date Overlay
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWidget(
                imagePath: imagePath,
                height: ResponsiveUtils.width(195),
                width: ResponsiveUtils.width(195),
                fit: BoxFit.cover,
              ),
            ),
            const SpaceWidget(spaceHeight: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWidget(
                imagePath: brandImagePath,
                height: ResponsiveUtils.height(17),
                width: ResponsiveUtils.width(74),
                fit: BoxFit.contain,
              ),
            ),
            const SpaceWidget(spaceHeight: 16),
            // Event Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: ResponsiveUtils.width(185),
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
                const SpaceWidget(spaceHeight: 6),
                SizedBox(
                  width: ResponsiveUtils.width(185),
                  child: TextWidget(
                    text: location,
                    fontColor: AppColors.contentPrimaryLight.withOpacity(0.5),
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlignment: TextAlign.start,
                  ),
                ),
                const SpaceWidget(spaceHeight: 10),
                TextWidget(
                  text: price,
                  fontColor: AppColors.contentPrimaryLight,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
