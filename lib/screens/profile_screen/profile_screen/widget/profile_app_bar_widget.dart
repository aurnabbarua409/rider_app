import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_icon_path.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/routes/app_routes.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';
import 'package:trackdays_planner/widgets/image_widget/image_widget.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 40, left: 8, right: 8, bottom: 24),
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImagePath.appbarBg),
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
        border: Border.all(color: AppColors.greyLight),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                tooltip: "Notifications",
                onPressed: () {
                  Get.toNamed(AppRoutes.notificationsScreen);
                },
                icon: const Badge(
                  isLabelVisible: true,
                  label: Text("3"),
                  backgroundColor: AppColors.mainBrandColor,
                  child: IconWidget(
                    icon: AppIconPath.notificationIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const ImageWidget(
                imagePath: AppImagePath.appLogoRed,
                fit: BoxFit.contain,
                height: 60,
                width: 187,
              ),
              IconButton(
                tooltip: "Cart",
                onPressed: () {
                  Get.toNamed(AppRoutes.cartScreen);
                },
                icon: const Badge(
                  isLabelVisible: true,
                  label: Text("2"),
                  backgroundColor: AppColors.mainBrandColor,
                  child: IconWidget(
                    icon: AppIconPath.cartIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
