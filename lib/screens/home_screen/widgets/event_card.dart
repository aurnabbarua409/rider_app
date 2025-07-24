import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/routes/app_routes.dart';
import 'package:trackdays_planner/screens/all_events_event_details_screen/widgets/age_checkbox_widget.dart';
import 'package:trackdays_planner/screens/all_events_event_details_screen/widgets/travel_method_dropdown_widget.dart';
import 'package:trackdays_planner/screens/purchased_events_event_details_screen/controller/purchased_events_event_details_screen_controller.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/app_size.dart';
import '../../../widgets/space_widget/space_widget.dart';
import '../../../widgets/text_button_widget/text_button_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  int activeStep = 2;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PurchasedEventsEventDetailsScreenController());
    return Container(
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
          // Date and Image Section
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: AppStrings.yourPurchasedEvents.tr,
                  fontColor: AppColors.contentPrimaryLight,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                Row(
                  children: [
                    TextButtonWidget(
                      onPressed: () {},
                      text: AppStrings.seeAll.tr,
                      textColor: AppColors.mainBrandColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SpaceWidget(spaceWidth: 4),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.mainBrandColor,
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SpaceWidget(spaceHeight: 16),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.greyLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          AppImagePath.upcomingImage, // Use local asset
                          height: 227,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                                child: Icon(Icons.error, color: Colors.red));
                          },
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: ResponsiveUtils.width(72),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border:
                                Border.all(color: AppColors.secondBrandColor),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.mainBrandColor,
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(6)),
                                  border: Border.all(
                                      color: AppColors.secondBrandColor),
                                ),
                                child: const TextWidget(
                                  text: "APR",
                                  fontColor: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Column(
                                  children: [
                                    const TextWidget(
                                      text: "06",
                                      fontColor: AppColors.contentPrimaryLight,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                    TextWidget(
                                      text: "MON",
                                      fontColor: AppColors.contentPrimaryLight
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: ResponsiveUtils.width(300),
                  child: const TextWidget(
                    text: "Circuit de Valencia Ricardo Tormo",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColors.contentPrimaryLight,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlignment: TextAlign.start,
                  ),
                ),
                const SpaceWidget(spaceHeight: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: ResponsiveUtils.width(300),
                  child: const TextWidget(
                    text: "Spanje",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontColor: AppColors.contentSecondaryLight,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlignment: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: AppColors.mainBrandColor,
                          ),
                          SpaceWidget(spaceWidth: 4),
                          TextWidget(
                            text: "16:00 - 18:30",
                            fontColor: AppColors.contentPrimaryLight,
                            fontSize: 14,
                          ),
                          SpaceWidget(spaceWidth: 16),
                          Icon(
                            Icons.device_thermostat_outlined,
                            size: 16,
                            color: AppColors.mainBrandColor,
                          ),
                          SpaceWidget(spaceWidth: 4),
                          TextWidget(
                            text: "23°",
                            fontColor: AppColors.contentPrimaryLight,
                            fontSize: 14,
                          ),
                          SpaceWidget(spaceWidth: 16),
                          Icon(
                            Icons.loop,
                            size: 16,
                            color: AppColors.mainBrandColor,
                          ),
                          SpaceWidget(spaceWidth: 4),
                          TextWidget(
                            text: "14 T",
                            fontColor: AppColors.contentPrimaryLight,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Stepper Section
                SizedBox(
                  height: 80,
                  child: EasyStepper(
                    activeStep: activeStep,
                    showLoadingAnimation: false,
                    enableStepTapping: false,
                    lineStyle: LineStyle(
                      lineLength: 50,
                      lineThickness: 2,
                      lineType: LineType.dotted,
                      defaultLineColor:
                          AppColors.mainBrandColor.withOpacity(0.3),
                      activeLineColor: AppColors.mainBrandColor,
                      finishedLineColor: AppColors.mainBrandColor,
                      progress: 0.5,
                    ),
                    stepShape: StepShape.rRectangle,
                    stepBorderRadius: 10,
                    borderThickness: 2,
                    padding: const EdgeInsets.all(5),
                    stepRadius: 25,
                    finishedStepBackgroundColor: AppColors.mainBrandColor,
                    activeStepBackgroundColor: AppColors.white,
                    unreachedStepBackgroundColor: AppColors.white,
                    activeStepBorderColor: AppColors.mainBrandColor,
                    unreachedStepBorderColor: AppColors.contentSecondaryLight,
                    finishedStepBorderColor: AppColors.mainBrandColor,
                    steps: const [
                      EasyStep(
                        icon: Icon(Icons.confirmation_num_outlined,
                            color: AppColors.mainBrandColor),
                        activeIcon: Icon(Icons.confirmation_num_outlined,
                            color: AppColors.mainBrandColor),
                        finishIcon: Icon(Icons.confirmation_num_outlined,
                            color: AppColors.white),
                      ),
                      EasyStep(
                        icon: Icon(Icons.location_on_outlined,
                            color: AppColors.grey),
                        activeIcon: Icon(Icons.location_on_outlined,
                            color: AppColors.mainBrandColor),
                        finishIcon: Icon(Icons.location_on_outlined,
                            color: AppColors.white),
                      ),
                      EasyStep(
                        icon: Icon(Icons.person_add_alt_outlined,
                            color: AppColors.grey),
                        activeIcon: Icon(Icons.person_add_alt_outlined,
                            color: AppColors.mainBrandColor),
                        finishIcon: Icon(Icons.person_add_alt_outlined,
                            color: AppColors.white),
                      ),
                      EasyStep(
                        icon: Icon(Icons.flag_outlined, color: AppColors.grey),
                        activeIcon: Icon(Icons.flag_outlined,
                            color: AppColors.mainBrandColor),
                        finishIcon:
                            Icon(Icons.flag_outlined, color: AppColors.white),
                      ),
                      EasyStep(
                        icon: Icon(Icons.emoji_events_outlined,
                            color: AppColors.grey),
                        activeIcon: Icon(Icons.emoji_events_outlined,
                            color: AppColors.mainBrandColor),
                        finishIcon: Icon(Icons.emoji_events_outlined,
                            color: AppColors.white),
                      ),
                    ],
                    onStepReached: (index) {
                      setState(() {
                        activeStep = index;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: AppColors.contentPrimaryLight.withOpacity(0.1),
                    height: 1,
                  ),
                ),
                const SpaceWidget(spaceHeight: 16),
                // Buttons Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ButtonWidget(
                          onPressed: () {
                            Get.toNamed(
                                AppRoutes.purchasedEventsEventDetailsScreen);
                          },
                          label: AppStrings.viewDetails.tr,
                          buttonWidth: 150,
                          buttonHeight: 45,
                          fontSize: 14,
                        ),
                      ),
                      const SpaceWidget(spaceWidth: 12),
                      Expanded(
                        flex: 1,
                        child: ButtonWidget(
                          onPressed: () {
                            Get.bottomSheet(
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 24),
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 100,
                                          height: 4,
                                          padding: const EdgeInsets.all(13),
                                          decoration: BoxDecoration(
                                              color: AppColors
                                                  .contentSecondaryLight
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                        ),
                                      ),
                                      const SpaceWidget(spaceHeight: 32),
                                      TextWidget(
                                        text: AppStrings.fillFormText.tr,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontColor:
                                            AppColors.contentPrimaryLight,
                                      ),
                                      const SpaceWidget(spaceHeight: 16),

                                      // Insurance Name TextField
                                      TextFieldWidget(
                                        controller:
                                            controller.insuranceNameController,
                                        labelText: AppStrings.insuranceName.tr,
                                        maxLines: 1,
                                      ),
                                      const SpaceWidget(spaceHeight: 16),
                                      // Insurance Number TextField
                                      TextFieldWidget(
                                        controller: controller
                                            .insuranceNumberController,
                                        labelText:
                                            AppStrings.insuranceNumber.tr,
                                        maxLines: 1,
                                      ),
                                      const SpaceWidget(spaceHeight: 16),
                                      // Travel Method Dropdown
                                      Obx(() => TravelMethodDropdownWidget(
                                            value: controller
                                                .selectedTravelMethod.value,
                                            onChanged: (value) {
                                              if (value != null) {
                                                controller.selectedTravelMethod
                                                    .value = value;
                                              }
                                            },
                                            items: controller.travelMethods,
                                          )),
                                      const SpaceWidget(spaceHeight: 16),
                                      // Checkbox
                                      Obx(() => AgeCheckboxWidget(
                                            value: controller.isOver16.value,
                                            onChanged: (value) {
                                              controller.isOver16.value =
                                                  value ?? false;
                                            },
                                          )),
                                      const SpaceWidget(spaceHeight: 16),
                                      // Buttons
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: ButtonWidget(
                                              onPressed: controller.submitForm,
                                              label: AppStrings.submit.tr,
                                              buttonWidth: 188,
                                            ),
                                          ),
                                          const SpaceWidget(spaceWidth: 16),
                                          Expanded(
                                            flex: 1,
                                            child: ButtonWidget(
                                              onPressed: controller.skipForm,
                                              label: AppStrings.skip.tr,
                                              buttonWidth: 188,
                                              backgroundColor: AppColors.white,
                                              borderColor:
                                                  AppColors.mainBrandColor,
                                              textColor:
                                                  AppColors.mainBrandColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              isScrollControlled: true,
                            );
                          },
                          label: AppStrings.fillForm.tr,
                          buttonWidth: 150,
                          buttonHeight: 45,
                          backgroundColor: AppColors.white,
                          borderColor: AppColors.mainBrandColor,
                          fontSize: 14,
                          textColor: AppColors.mainBrandColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SpaceWidget(spaceHeight: 16),
              ],
            ),
          ),
          // Event Details
        ],
      ),
    );
  }
}
