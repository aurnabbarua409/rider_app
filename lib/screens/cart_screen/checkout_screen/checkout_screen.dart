import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_icon_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/cart_screen/checkout_screen/controller/checkout_controller.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/appbar_widget/appbar_widget.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/date_badge_widget/date_badge_widget.dart';
import 'package:trackdays_planner/widgets/icon_button_widget/icon_button_widget.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';
import 'package:trackdays_planner/widgets/image_widget/image_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: TextWidget(
          text: AppStrings.checkout,
          fontColor: AppColors.contentPrimaryLight,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: CheckoutController(),
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                child: TextWidget(
                  text: AppStrings.orderSummary,
                  fontColor: AppColors.contentPrimaryLight,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyLight),
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ImageWidget(
                                          height: 100,
                                          width: 100,
                                          imagePath: item.imageUrl),
                                      const SpaceWidget(
                                        spaceHeight: 10,
                                      ),
                                      ImageWidget(
                                          height: 10,
                                          width: 100,
                                          imagePath: item.brandImageUrl),
                                      const SpaceWidget(
                                        spaceHeight: 8,
                                      ),
                                      TextWidget(
                                        text: item.name,
                                        fontColor:
                                            AppColors.contentPrimaryLight,
                                        textAlignment: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SpaceWidget(
                                        spaceHeight: 4,
                                      ),
                                      TextWidget(
                                        text: item.price.toString(),
                                        fontSize: 18,
                                        fontColor:
                                            AppColors.contentPrimaryLight,
                                      ),
                                    ],
                                  ),
                                  const SpaceWidget(
                                    spaceWidth: 20,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: controller.eventItem.value!.name,
                                        fontColor:
                                            AppColors.contentPrimaryLight,
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
                                              fontColor: AppColors
                                                  .contentSecondaryLight,
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
                                    color: AppColors.mainBrandColor
                                        .withOpacity(0.1),
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
                                controller:
                                    controller.insuranceNumberController,
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
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                                controller: controller.discountController,
                                labelText: AppStrings.discountCode),
                          ),
                          const SpaceWidget(
                            spaceWidth: 10,
                          ),
                          const ButtonWidget(
                            label: AppStrings.submit,
                            buttonWidth: 100,
                          )
                        ],
                      ),
                      const SpaceWidget(
                        spaceHeight: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                              child: TextWidget(
                            text: AppStrings.productPrice,
                            fontColor: AppColors.contentPrimaryLight,
                            textAlignment: TextAlign.left,
                            fontSize: 17,
                          )),
                          Spacer(),
                          Expanded(
                            child: TextWidget(
                              text: "€579.90",
                              fontColor: AppColors.contentPrimaryLight,
                              textAlignment: TextAlign.right,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      const SpaceWidget(
                        spaceHeight: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                              child: TextWidget(
                            text: AppStrings.ticketPrice,
                            fontColor: AppColors.contentPrimaryLight,
                            textAlignment: TextAlign.left,
                            fontSize: 17,
                          )),
                          Spacer(),
                          Expanded(
                            child: TextWidget(
                              text: "€579.90",
                              fontColor: AppColors.contentPrimaryLight,
                              textAlignment: TextAlign.right,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      const SpaceWidget(
                        spaceHeight: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                              child: TextWidget(
                            text: AppStrings.feePaid,
                            fontColor: AppColors.contentPrimaryLight,
                            textAlignment: TextAlign.left,
                            fontSize: 17,
                          )),
                          Spacer(),
                          Expanded(
                            child: TextWidget(
                              text: "€19.90",
                              fontColor: AppColors.contentPrimaryLight,
                              textAlignment: TextAlign.right,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      const SpaceWidget(
                        spaceHeight: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                              child: TextWidget(
                            text: AppStrings.delivery,
                            fontColor: AppColors.contentPrimaryLight,
                            textAlignment: TextAlign.left,
                            fontSize: 17,
                          )),
                          Spacer(),
                          Expanded(
                            child: TextWidget(
                              text: "€59.90",
                              fontColor: AppColors.contentPrimaryLight,
                              textAlignment: TextAlign.right,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      const SpaceWidget(
                        spaceHeight: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                              child: TextWidget(
                            text: AppStrings.tax,
                            fontColor: AppColors.contentPrimaryLight,
                            textAlignment: TextAlign.left,
                            fontSize: 17,
                          )),
                          Spacer(),
                          Expanded(
                            child: TextWidget(
                              text: "€59.90",
                              fontColor: AppColors.contentPrimaryLight,
                              textAlignment: TextAlign.right,
                              fontSize: 17,
                            ),
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
                        spaceHeight: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                              child: TextWidget(
                            text: AppStrings.totalPrice,
                            fontColor: AppColors.contentPrimaryLight,
                            textAlignment: TextAlign.left,
                            fontSize: 17,
                          )),
                          Spacer(),
                          Expanded(
                            child: TextWidget(
                              text: "€697.90",
                              fontColor: AppColors.contentPrimaryLight,
                              textAlignment: TextAlign.right,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SpaceWidget(
                        spaceHeight: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey)),
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 40),
                child: const ButtonWidget(
                  label: "${AppStrings.payNow} €697.90",
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
