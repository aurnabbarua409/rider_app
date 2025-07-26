import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_icon_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/order_details_screen/controller/order_details_controller.dart';
import 'package:trackdays_planner/screens/order_details_screen/widgets/order_item_widget.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/appbar_widget/appbar_widget.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/cart_item_widget/cart_item_widget.dart';
import 'package:trackdays_planner/widgets/date_badge_widget/date_badge_widget.dart';
import 'package:trackdays_planner/widgets/icon_button_widget/icon_button_widget.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      appBar: AppbarWidget(
        title: const TextWidget(
          text: AppStrings.orderDetails,
          fontColor: AppColors.contentPrimaryLight,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
        action: PopupMenuButton(
          color: AppColors.white,
          itemBuilder: (context) => [
            const PopupMenuItem(
                child: Row(
              children: [
                IconWidget(
                    height: 20, width: 20, icon: AppIconPath.deleteIcon1),
                SpaceWidget(
                  spaceWidth: 6,
                ),
                TextWidget(
                  text: AppStrings.cancelOrder,
                  fontColor: AppColors.contentPrimaryLight,
                  fontSize: 16,
                )
              ],
            )),
          ],
        ),
      ),
      body: GetBuilder(
        init: OrderDetailsController(),
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin:
                    const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
                decoration: BoxDecoration(
                    color: AppColors.red50,
                    border: Border.all(color: AppColors.red100),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const IconWidget(
                        height: 20, width: 20, icon: AppIconPath.infoIcon),
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.cardItem.length,
                          itemBuilder: (context, index) {
                            final item = controller.cardItem[index];
                            return Row(
                              children: [
                                CartItemWidget(
                                    name: item.name,
                                    contentImageUrl: item.imageUrl,
                                    brandImageUrl: item.brandImageUrl,
                                    quantity: item.quantity,
                                    price: item.price,
                                    description: item.description),
                                const SpaceWidget(
                                  spaceWidth: 15,
                                )
                              ],
                            );
                          }),
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    const TextWidget(
                      text: AppStrings.delivaryAddress,
                      fontColor: AppColors.contentSecondaryLight,
                      fontSize: 16,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.countryController,
                        labelText: AppStrings.country),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.streetController,
                        labelText: AppStrings.streetName),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.apiSuiteUnitController,
                              labelText: AppStrings.aptSuiteUnit),
                        ),
                        const SpaceWidget(
                          spaceWidth: 10,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.additionalController,
                              labelText: AppStrings.additional),
                        ),
                      ],
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.stateProvinceController,
                              labelText: AppStrings.stateProvince),
                        ),
                        const SpaceWidget(
                          spaceWidth: 10,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.cityTownController,
                              labelText: AppStrings.cityTown),
                        ),
                      ],
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.zipPostalCodeController,
                        labelText: AppStrings.zipPostalCode),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    const Divider(
                      color: AppColors.greyLight,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Container(
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
                                  month: controller.eventItem.value!.month,
                                  date: controller.eventItem.value!.date,
                                  day: controller.eventItem.value!.day),
                              const SpaceWidget(
                                spaceWidth: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: controller.eventItem.value!.name,
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
                                        Expanded(
                                          child: TextWidget(
                                            text: controller
                                                .eventItem.value!.description,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            fontColor:
                                                AppColors.contentSecondaryLight,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SpaceWidget(
                            spaceHeight: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: ResponsiveUtils.width(24),
                                height: ResponsiveUtils.width(24),
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.mainBrandColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: controller.eventItem.value!.quantity
                                        .toString(),
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
                                    "€${(controller.eventItem.value!.price * controller.eventItem.value!.quantity).toStringAsFixed(2)}",
                                fontColor: AppColors.contentPrimaryLight,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                textAlignment: TextAlign.start,
                              ),
                              const Spacer(),
                              IconButtonWidget(
                                icon: AppIconPath.deleteIcon,
                                onTap: () {},
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const TextWidget(
                      text: AppStrings.participantInformation,
                      fontColor: AppColors.contentSecondaryLight,
                      fontSize: 16,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.fullnameController,
                        labelText: AppStrings.fullName),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.insuranceNameController,
                              labelText: AppStrings.insuranceName),
                        ),
                        const SpaceWidget(
                          spaceWidth: 10,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.insuranceNumberController,
                              labelText: AppStrings.insuranceNumber),
                        )
                      ],
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.groupController,
                              labelText: AppStrings.group),
                        ),
                        const SpaceWidget(
                          spaceWidth: 10,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.pitboxController,
                              labelText: AppStrings.pitbox),
                        )
                      ],
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    const Divider(
                      color: AppColors.greyLight,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.paymentController,
                      labelText: AppStrings.paymentMethod,
                      suffixIcon: AppIconPath.mastercardIcon,
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const Divider(
                      color: AppColors.greyLight,
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const OrderItemWidget(
                        label: AppStrings.orderNumber, content: "ORD-203945"),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const OrderItemWidget(
                        label: AppStrings.orderDate, content: "April 10, 2025"),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const OrderItemWidget(
                        label: AppStrings.itemsCount, content: "2 items"),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const Divider(
                      color: AppColors.greyLight,
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const OrderItemWidget(
                        label: AppStrings.itemsPrice, content: "€579.90"),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const OrderItemWidget(
                        label: AppStrings.feePaid, content: "€19.90"),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const OrderItemWidget(
                        label: AppStrings.delivery, content: "€49.90"),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const OrderItemWidget(label: AppStrings.tax, content: "€57.90"),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const OrderItemWidget(
                      label: AppStrings.discount,
                      content: "- €57.90",
                      contentColor: AppColors.mainBrandColor,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    const Divider(
                      color: AppColors.greyLight,
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const OrderItemWidget(
                      label: AppStrings.totalPrice,
                      content: "€697.60",
                      contentFontSize: 21,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey)),
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 40),
                child: const ButtonWidget(
                  label: AppStrings.downloadInvoice,
                  buttonWidth: double.infinity,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
