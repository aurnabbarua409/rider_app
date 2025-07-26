import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_icon_path.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/profile_screen/order_history_screen/controller/order_history_controller.dart';
import 'package:trackdays_planner/widgets/appbar_widget/appbar_widget.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/cart_item_widget/cart_item_widget.dart';
import 'package:trackdays_planner/widgets/date_badge_widget/date_badge_widget.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';
import 'package:trackdays_planner/widgets/image_widget/image_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';
import 'package:universal_stepper/universal_stepper.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  int activeStep = 1;

  StepperBadgePosition badgePosition = StepperBadgePosition.center;

  bool isInverted = false;
  final stepIcons = const <IconData>[
    Icons.check_circle_outline,
    Icons.inventory_2_outlined,
    Icons.local_shipping_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      appBar: const AppbarWidget(
        backgroundColor: AppColors.thirdBrandColor,
        title: TextWidget(
          text: AppStrings.orderHistory,
          fontColor: AppColors.contentPrimaryLight,
          fontSize: 20,
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(right: 16),
        action:
            IconWidget(height: 25, width: 25, icon: AppIconPath.filterIcon1),
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
                      SizedBox(
                        height: 80,
                        child: EasyStepper(
                          activeStep: activeStep,
                          showLoadingAnimation: false,
                          enableStepTapping: false,
                          lineStyle: const LineStyle(
                            lineLength: 85,
                            lineThickness: 2,
                            lineType: LineType.normal,
                            defaultLineColor: AppColors.mainBrandColor,
                            activeLineColor: AppColors.mainBrandColor,
                            finishedLineColor: AppColors.mainBrandColor,
                            unreachedLineType: LineType.dashed,
                          ),
                          stepShape: StepShape.rRectangle,
                          stepBorderRadius: 10,
                          borderThickness: 2,
                          padding: const EdgeInsets.all(5),
                          stepRadius: 25,
                          unreachedStepIconColor: AppColors.red200,
                          unreachedStepBorderType: BorderType.normal,
                          finishedStepBorderType: BorderType.normal,
                          finishedStepIconColor: AppColors.white,
                          finishedStepBackgroundColor: AppColors.mainBrandColor,
                          activeStepBackgroundColor: AppColors.red50,
                          activeStepBorderType: BorderType.normal,
                          activeStepIconColor: AppColors.mainBrandColor,
                          unreachedStepBackgroundColor: AppColors.white,
                          activeStepBorderColor: AppColors.mainBrandColor,
                          unreachedStepBorderColor: AppColors.mainBrandColor,
                          finishedStepBorderColor: AppColors.mainBrandColor,
                          steps: List.generate(
                            stepIcons.length,
                            (index) => EasyStep(
                              icon: Icon(stepIcons[index],
                                  color: AppColors.white),
                              activeIcon: Icon(stepIcons[index],
                                  color: AppColors.white),
                              finishIcon: Icon(stepIcons[index],
                                  color: AppColors.white),
                            ),
                          ),
                          onStepReached: (index) {},
                        ),
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
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DateBadgeWidget(
                                    width: 100,
                                    height: 100,
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
                                      "€${controller.eventItem[0].price.toString()}",
                                  fontColor: AppColors.contentPrimaryLight,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                          const SpaceWidget(
                            spaceWidth: 10,
                          ),
                          CartItemWidget(
                            contentImageUrl: controller.cartItem[0].imageUrl,
                            brandImageUrl: controller.cartItem[0].brandImageUrl,
                            quantity: controller.cartItem[0].quantity,
                            price: controller.cartItem[0].price,
                            description: controller.cartItem[0].description,
                            name: controller.cartItem[0].name,
                          ),
                          const SpaceWidget(
                            spaceWidth: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.greyLight)),
                                  child: const TextWidget(
                                    text: "+3",
                                    fontColor: AppColors.contentSecondaryLight,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SpaceWidget(
                                  spaceHeight: 60,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SpaceWidget(
                        spaceHeight: 10,
                      ),
                      ButtonWidget(
                        label: AppStrings.viewDetails,
                        buttonWidth: double.infinity,
                        onPressed: controller.viewDetails,
                      )
                    ],
                  ),
                ),
                const SpaceWidget(
                  spaceHeight: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  child: const ImageWidget(
                    height: 150,
                    width: double.infinity,
                    imagePath: AppImagePath.adsImage,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
