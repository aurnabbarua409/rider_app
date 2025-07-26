import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/screens/Filter_search_screen/filter_search_screen.dart';
import 'package:trackdays_planner/screens/search_result_screen/search_result_screen.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icon_path.dart';
import '../../../constants/app_image_path.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_size.dart';
import '../../../widgets/icon_widget/icon_widget.dart';
import '../../../widgets/image_widget/image_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';

class HomeScreenAppBarWidget extends StatelessWidget {
  final String notificationLabel;
  final String cartLabel;
  final TextEditingController searchController;

  const HomeScreenAppBarWidget({
    super.key,
    required this.notificationLabel,
    required this.cartLabel,
    required this.searchController,
  });

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
                icon: Badge(
                  isLabelVisible: true,
                  label: Text(notificationLabel),
                  backgroundColor: AppColors.mainBrandColor,
                  child: const IconWidget(
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
                  // Navigate to cart screen
                  Get.toNamed(AppRoutes.cartScreen);
                },
                icon: Badge(
                  isLabelVisible: true,
                  label: Text(cartLabel),
                  backgroundColor: AppColors.mainBrandColor,
                  child: const IconWidget(
                    icon: AppIconPath.cartIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
          const SpaceWidget(spaceHeight: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      //for demo only
                      Get.to(SearchResultScreen(
                          searchController: searchController));
                      if (value.isEmpty) {
                        Get.back();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Search for event, product, etc.',
                      hintStyle: TextStyle(
                          color:
                              AppColors.contentPrimaryLight.withOpacity(0.3)),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(12),
                        child: IconWidget(
                          icon: AppIconPath.searchIcon,
                          width: 16,
                          height: 16,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.greyLight,
                          width: ResponsiveUtils.width(1)
                              .clamp(0.0, double.infinity),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.secondBrandColor,
                          width: ResponsiveUtils.width(1)
                              .clamp(0.0, double.infinity),
                        ),
                      ),
                    ),
                  ),
                ),
                const SpaceWidget(
                  spaceWidth: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.greyLight),
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    onPressed: () {
                      Get.bottomSheet(const FilterSearchScreen());
                    },
                    icon: Badge(
                      isLabelVisible: true,
                      label: Text(notificationLabel),
                      backgroundColor: AppColors.mainBrandColor,
                      child: const IconWidget(
                        icon: AppIconPath.filterIcon1,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
