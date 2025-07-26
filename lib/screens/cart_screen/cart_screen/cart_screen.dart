import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/routes/app_routes.dart';
import 'package:trackdays_planner/screens/cart_screen/cart_screen/controller/cart_Controller.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/date_badge_widget/date_badge_widget.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icon_path.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../widgets/button_widget/button_widget.dart';
import '../../../widgets/icon_button_widget/icon_button_widget.dart';
import '../../../widgets/image_widget/image_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final controller = Get.put(CartController());

  Widget EmptyCard() {
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      appBar: const AppbarWidget(
        centerTitle: true,
        backgroundColor: AppColors.thirdBrandColor,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(
              height: 100,
              width: 100,
              icon: AppIconPath.cartIcon,
              color: AppColors.greyLight,
            ),
            SpaceWidget(
              spaceHeight: 20,
            ),
            TextWidget(
              text: AppStrings.yourCartEmpty,
              fontColor: AppColors.contentPrimaryLight,
              fontSize: 18,
            ),
            SpaceWidget(
              spaceHeight: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextWidget(
                text: AppStrings.emptyCartDetails,
                softwrap: true,
                fontColor: AppColors.contentSecondaryLight,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyLight),
            color: AppColors.white,
          ),
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 30),
          child: ButtonWidget(
            label: AppStrings.exploreShop,
            onPressed: () {},
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (controller.cartItems.isEmpty && controller.eventItem.isEmpty) {
      return EmptyCard();
    }
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      appBar: const AppbarWidget(centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: TextWidget(
              text: AppStrings.cartItems.tr,
              fontColor: AppColors.contentPrimaryLight,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          ...List.generate(
            controller.cartItems.length,
            (index) {
              final item = controller.cartItems[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ImageWidget(
                            imagePath: item.imageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SpaceWidget(spaceWidth: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ImageWidget(
                                fit: BoxFit.fill,
                                height: 12,
                                width: 150,
                                imagePath: item.brandImageUrl),
                            const SpaceWidget(
                              spaceHeight: 4,
                            ),
                            TextWidget(
                              text: item.name,
                              fontColor: AppColors.contentPrimaryLight,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              textAlignment: TextAlign.start,
                            ),
                            const SpaceWidget(spaceHeight: 4),
                            SizedBox(
                              width: ResponsiveUtils.width(200),
                              child: TextWidget(
                                text: item.description,
                                fontColor: AppColors.contentPrimaryLight
                                    .withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                textAlignment: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SpaceWidget(spaceHeight: 6),
                            Row(
                              children: [
                                Container(
                                  width: ResponsiveUtils.width(24),
                                  height: ResponsiveUtils.width(24),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainBrandColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                      text: item.quantity.toString(),
                                      fontColor: AppColors.mainBrandColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      textAlignment: TextAlign.start,
                                    ),
                                  ),
                                ),
                                const SpaceWidget(spaceWidth: 8),
                                TextWidget(
                                  text:
                                      "€${(item.price * item.quantity).toStringAsFixed(2)}",
                                  fontColor: AppColors.contentPrimaryLight,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  textAlignment: TextAlign.start,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButtonWidget(
                      icon: AppIconPath.deleteIcon,
                      onTap: () => controller.removeItem(index),
                      size: 20,
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: const Divider(
              color: AppColors.greyLight,
            ),
          ),
          ...List.generate(
            controller.eventItem.length,
            (index) {
              final item = controller.eventItem[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.greyLight)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          DateBadgeWidget(
                              month: item.month,
                              date: item.date,
                              day: item.day),
                          const SpaceWidget(
                            spaceWidth: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: item.name,
                                  fontColor: AppColors.contentPrimaryLight,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  softwrap: true,
                                  maxLines: 2,
                                  textAlignment: TextAlign.left,
                                ),
                                Row(
                                  children: [
                                    const IconWidget(
                                        height: 15,
                                        width: 15,
                                        icon: AppIconPath.eventIcon),
                                    const SpaceWidget(
                                      spaceWidth: 10,
                                    ),
                                    TextWidget(
                                      text: item.description,
                                      fontColor:
                                          AppColors.contentSecondaryLight,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SpaceWidget(
                        spaceHeight: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: ResponsiveUtils.width(24),
                            height: ResponsiveUtils.width(24),
                            decoration: BoxDecoration(
                              color: AppColors.mainBrandColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: TextWidget(
                                text: item.quantity.toString(),
                                fontColor: AppColors.mainBrandColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                textAlignment: TextAlign.start,
                              ),
                            ),
                          ),
                          const SpaceWidget(spaceWidth: 8),
                          TextWidget(
                            text:
                                "€${(item.price * item.quantity).toStringAsFixed(2)}",
                            fontColor: AppColors.contentPrimaryLight,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            textAlignment: TextAlign.start,
                          ),
                          Spacer(),
                          IconButtonWidget(
                            icon: AppIconPath.deleteIcon,
                            onTap: () => controller.removeItem(index),
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: AppStrings.totalPrice.tr,
                        fontColor:
                            AppColors.contentPrimaryLight.withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      const SpaceWidget(spaceHeight: 2),
                      TextWidget(
                        text: "€${controller.totalPrice.toStringAsFixed(2)}",
                        fontColor: AppColors.contentPrimaryLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ],
                  ),
                ),
                const SpaceWidget(spaceWidth: 12),
                Expanded(
                  flex: 2,
                  child: ButtonWidget(
                    onPressed: () {
                      Get.toNamed(AppRoutes.chekoutScreen);
                    },
                    label: AppStrings.continueText.tr,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
