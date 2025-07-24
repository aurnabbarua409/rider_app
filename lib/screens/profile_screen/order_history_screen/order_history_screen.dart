import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_icon_path.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/profile_screen/order_history_screen/controller/order_history_controller.dart';
import 'package:trackdays_planner/widgets/appbar_widget/appbar_widget.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/date_badge_widget/date_badge_widget.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';
import 'package:trackdays_planner/widgets/image_widget/image_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: TextWidget(
          text: AppStrings.orderHistory,
          fontColor: AppColors.contentPrimaryLight,
          fontSize: 20,
        ),
        centerTitle: true,
        action: IconWidget(height: 48, width: 48, icon: AppIconPath.filterIcon),
      ),
      body: GetBuilder(
        init: OrderHistoryController(),
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  text: AppStrings.lastMonth,
                  fontColor: AppColors.contentSecondaryLight,
                  fontSize: 16,
                ),
                const SpaceWidget(
                  spaceHeight: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyLight),
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.white),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          TextWidget(
                            text: "${AppStrings.orderedOn}:",
                            fontColor: AppColors.contentPrimaryLight,
                          ),
                          Spacer(),
                          TextWidget(
                            text: "May 24, 2025",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontColor: AppColors.contentPrimaryLight,
                          )
                        ],
                      ),
                      const SpaceWidget(
                        spaceHeight: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.red50,
                            border: Border.all(color: AppColors.red100),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const IconWidget(
                                height: 20,
                                width: 20,
                                icon: AppIconPath.infoIcon),
                            const SpaceWidget(
                              spaceWidth: 10,
                            ),
                            const TextWidget(
                              text: AppStrings.orderStatus,
                              fontColor: AppColors.contentPrimaryLight,
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const TextWidget(
                                text: "Processing",
                                fontColor: AppColors.contentPrimaryLight,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SpaceWidget(
                        spaceHeight: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DateBadgeWidget(
                                    width: 90,
                                    month: controller.eventItem[0].month,
                                    date: controller.eventItem[0].date,
                                    day: controller.eventItem[0].day),
                                const SpaceWidget(
                                  spaceHeight: 10,
                                ),
                                Row(
                                  children: [
                                    const IconWidget(
                                        height: 16,
                                        width: 16,
                                        icon: AppIconPath.eventIcon),
                                    const SpaceWidget(
                                      spaceWidth: 10,
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text:
                                            controller.eventItem[0].description,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        fontColor:
                                            AppColors.contentPrimaryLight,
                                      ),
                                    )
                                  ],
                                ),
                                TextWidget(
                                  text: controller.eventItem[0].name,
                                  fontColor: AppColors.contentPrimaryLight,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                TextWidget(
                                  text:
                                      controller.eventItem[0].price.toString(),
                                  fontColor: AppColors.contentPrimaryLight,
                                )
                              ],
                            ),
                          ),
                          const SpaceWidget(
                            spaceWidth: 10,
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ImageWidget(
                                    height: 90,
                                    width: 90,
                                    imagePath: controller.cartItem[0].imageUrl),
                                const SpaceWidget(
                                  spaceHeight: 10,
                                ),
                                ImageWidget(
                                    height: 12,
                                    width: 100,
                                    imagePath:
                                        controller.cartItem[0].brandImageUrl),
                                TextWidget(
                                  text: controller.cartItem[0].name,
                                  fontColor: AppColors.contentPrimaryLight,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                TextWidget(
                                  text: controller.cartItem[0].price.toString(),
                                  fontColor: AppColors.contentPrimaryLight,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SpaceWidget(
                        spaceHeight: 10,
                      ),
                      const ButtonWidget(
                        label: AppStrings.viewDetails,
                        buttonWidth: double.infinity,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
