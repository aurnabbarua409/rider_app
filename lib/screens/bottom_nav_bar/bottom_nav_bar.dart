import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icon_path.dart';
import 'controller/bottom_nav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: _buildBottomNavBar(controller),
    );
  }

  // Custom BottomNavigationBar widget
  Obx _buildBottomNavBar(BottomNavController controller) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onItemTapped,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.mainBrandColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.contentSecondaryLight,
        items: _buildNavBarItems(controller),
        showUnselectedLabels: false,
        showSelectedLabels: false,
      );
    });
  }

  // Method to create BottomNavigationBarItems
  List<BottomNavigationBarItem> _buildNavBarItems(
      BottomNavController controller) {
    final List<String> labels = ['', '', '', '', ''];
    final List<String> iconPaths = [
      AppIconPath.homeIcon,
      AppIconPath.productIcon,
      AppIconPath.couponIcon,
      AppIconPath.imageIcon,
      AppIconPath.profileIcon,
    ];

    return List.generate(5, (index) {
      return BottomNavigationBarItem(
        icon: IconWidget(
          icon: iconPaths[index],
          width: 24,
          height: 24,
          color: controller.selectedIndex.value == index
              ? AppColors.mainBrandColor
              : AppColors.contentSecondaryLight,
        ),
        label: labels[index],
      );
    });
  }
}
