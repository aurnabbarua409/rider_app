import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/screens/product_screen/widgets/best_selling_widget.dart';
import 'package:trackdays_planner/screens/product_screen/widgets/product_screen_appbar_widget.dart';
import 'package:trackdays_planner/screens/product_screen/widgets/shop_top_products_widget.dart';
import 'package:trackdays_planner/utils/app_size.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_image_path.dart';
import '../../constants/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../widgets/space_widget/space_widget.dart';
import '../../widgets/text_widget/text_widgets.dart';
import 'controller/product_screen_controller.dart';

class ProductScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final ProductController controller = Get.put(ProductController());

  ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      body: Column(
        children: [
          ProductScreenAppBarWidget(
            searchController: searchController,
            notificationLabel: '3',
            cartLabel: '1',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceWidget(spaceHeight: 24),

                  // Best Selling Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AppImagePath.bestSellingBg),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextWidget(
                            text: AppStrings.bestSelling.tr,
                            fontColor: AppColors.contentPrimaryLight,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SpaceWidget(spaceHeight: 12),
                        Obx(
                          () => SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: List.generate(
                                controller.bestSellingImages.length,
                                (index) => Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0 ? 24 : 0,
                                    right: index ==
                                            controller
                                                    .bestSellingImages.length -
                                                1
                                        ? 24
                                        : 16,
                                  ),
                                  child: BestSellingWidget(
                                    imagePath:
                                        controller.bestSellingImages[index],
                                    brandImagePath: controller
                                        .bestSellingBrandImages[index],
                                    eventName:
                                        controller.bestSellingNames[index],
                                    location:
                                        controller.bestSellingDetails[index],
                                    price: controller.bestSellingPrices[index],
                                    onPressed: () {
                                      Get.toNamed(
                                          AppRoutes.productDetailScreen);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SpaceWidget(spaceHeight: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextWidget(
                      text: AppStrings.shopTopProducts.tr,
                      fontColor: AppColors.contentPrimaryLight,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SpaceWidget(spaceHeight: 12),
                  Obx(
                    () => GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 8.0,
                      crossAxisCount: 2,
                      childAspectRatio: ResponsiveUtils.height(0.5),
                      children: List.generate(
                        controller.itemsToShow.value >
                                controller.shopTopImages.length
                            ? controller.shopTopImages.length
                            : controller.itemsToShow.value,
                        (index) => ShopTopProductWidget(
                          imagePath: controller.shopTopImages[index],
                          brandImagePath: controller.shopTopBrandImages[index],
                          eventName: controller.shopTopName[index],
                          location: controller.shopTopDetails[index],
                          price: controller.shopTopPrices[index],
                          onPressed: () {
                            Get.toNamed(AppRoutes.productDetailScreen);
                          },
                        ),
                      ),
                    ),
                  ),
                  const SpaceWidget(spaceHeight: 12),
                  Obx(
                    () => controller.itemsToShow.value <
                            controller.shopTopImages.length
                        ? Center(
                            child: InkWell(
                              onTap: controller.loadMoreItems,
                              child: Column(
                                children: [
                                  TextWidget(
                                    text: AppStrings.loadMore.tr,
                                    fontColor: AppColors.mainBrandColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: AppColors.mainBrandColor,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SpaceWidget(spaceHeight: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
