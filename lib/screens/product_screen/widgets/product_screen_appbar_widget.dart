import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/screens/Filter_search_screen/filter_search_screen.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icon_path.dart';
import '../../../constants/app_image_path.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_size.dart';
import '../../../widgets/icon_button_widget/icon_button_widget.dart';
import '../../../widgets/icon_widget/icon_widget.dart';
import '../../../widgets/image_widget/image_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';

class ProductScreenAppBarWidget extends StatelessWidget {
  final String notificationLabel;
  final String cartLabel;
  final TextEditingController searchController;

  const ProductScreenAppBarWidget({
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
                onPressed: () {},
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
                          width: ResponsiveUtils.width(1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.secondBrandColor,
                          width: ResponsiveUtils.width(1),
                        ),
                      ),
                    ),
                  ),
                ),
                const SpaceWidget(spaceWidth: 16),
                IconButton(
                  onPressed: () {
                    final controller = TextEditingController();
                    Get.bottomSheet(FilterSearchScreen());
                  },
                  icon: Badge(
                    isLabelVisible: true,
                    label: Text(notificationLabel),
                    backgroundColor: AppColors.mainBrandColor,
                    child: const IconWidget(
                      icon: AppIconPath.filterIcon,
                      width: 55,
                      height: 55,
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
