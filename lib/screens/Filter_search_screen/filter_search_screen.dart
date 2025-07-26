import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/Filter_search_screen/controller/filter_search_controller.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/dropdown_button_form_field_widget/dropdown_button_form_field_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_button_widget/text_button_widget.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class FilterSearchScreen extends StatefulWidget {
  const FilterSearchScreen({super.key});

  @override
  State<FilterSearchScreen> createState() => _FilterSearchScreenState();
}

class _FilterSearchScreenState extends State<FilterSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FilterSearchController(),
      builder: (controller) => Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        iconSize: 18,
                        icon: const Icon(Icons.close)),
                    const Expanded(
                      child: TextWidget(
                        text: AppStrings.filters,
                        fontColor: AppColors.contentPrimaryLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButtonWidget(
                      onPressed: controller.clearAll,
                      text: AppStrings.clearAll,
                      textColor: AppColors.mainBrandColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.mainBrandColor,
                    ),
                    const SpaceWidget(
                      spaceWidth: 16,
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          text: AppStrings.iamInterestedIn,
                          fontColor: AppColors.contentSecondaryLight,
                        ),
                        const SpaceWidget(
                          spaceHeight: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.contentSecondaryLight),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: [
                              ButtonWidget(
                                onPressed: controller.selectIsEvent,
                                label: AppStrings.events,
                                buttonWidth:
                                    MediaQuery.of(context).size.width * 0.4,
                                buttonHeight: 40,
                                buttonRadius: const BorderRadiusGeometry.all(
                                  Radius.circular(10),
                                ),
                                backgroundColor: controller.isEvent.value
                                    ? AppColors.mainBrandColor
                                    : Colors.white,
                                textColor: controller.isEvent.value
                                    ? Colors.white
                                    : AppColors.contentPrimaryLight,
                              ),
                              const Spacer(),
                              ButtonWidget(
                                onPressed: controller.selectIsEvent,
                                backgroundColor: controller.isEvent.value
                                    ? Colors.white
                                    : AppColors.mainBrandColor,
                                textColor: controller.isEvent.value
                                    ? AppColors.contentPrimaryLight
                                    : Colors.white,
                                label: AppStrings.products,
                                buttonWidth:
                                    MediaQuery.of(context).size.width * 0.4,
                                buttonHeight: 40,
                                buttonRadius: const BorderRadiusGeometry.all(
                                    Radius.circular(10)),
                              )
                            ],
                          ),
                        ),
                        const SpaceWidget(
                          spaceHeight: 10,
                        ),
                        controller.isEvent.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextWidget(
                                    text: AppStrings.circuitCity,
                                    fontColor: AppColors.contentSecondaryLight,
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: DropdownButtonFormFieldWidget(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            label: AppStrings.selectCircuit,
                                            onChanged: (p0) {
                                              controller.selectCircuit(p0);
                                            },
                                            items: const []),
                                      ),
                                      const SpaceWidget(
                                        spaceWidth: 10,
                                      ),
                                      Expanded(
                                        child: DropdownButtonFormFieldWidget(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            label: AppStrings.chooseCity,
                                            onChanged: (p0) {
                                              controller.selectCity(p0);
                                            },
                                            items: const []),
                                      ),
                                    ],
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  const TextWidget(
                                    text: AppStrings.date,
                                    fontColor: AppColors.contentSecondaryLight,
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFieldWidget(
                                          controller:
                                              controller.fromDateController,
                                          labelText: "MM.DD.YYYY",
                                        ),
                                      ),
                                      const SpaceWidget(
                                        spaceWidth: 10,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.greyLight,
                                      ),
                                      const SpaceWidget(
                                        spaceWidth: 10,
                                      ),
                                      Expanded(
                                        child: TextFieldWidget(
                                          controller:
                                              controller.toDateController,
                                          labelText: "MM.DD.YYYY",
                                        ),
                                      )
                                    ],
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  const TextWidget(
                                    text: AppStrings.groupLevelOrganizer,
                                    fontColor: AppColors.contentSecondaryLight,
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  DropdownButtonFormFieldWidget(
                                    // selectedValue: selectedValue!,
                                    label: AppStrings.chooseOrganizer,
                                    onChanged: (p0) {
                                      controller.selectOrganizer(p0);
                                    },
                                    items: const [],
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  DropdownButtonFormFieldWidget(
                                    // selectedValue: selectedValue!,
                                    label: AppStrings.chooseYourRidingGroup,
                                    onChanged: (p0) {
                                      controller.selectRidingGroup(p0);
                                    },
                                    items: const [],
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  const TextWidget(
                                    text: AppStrings.availability,
                                    fontColor: AppColors.contentSecondaryLight,
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.greyLight),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          const TextWidget(
                                            text: AppStrings
                                                .showAvailableEventsOnly,
                                            fontColor:
                                                AppColors.contentPrimaryLight,
                                            fontSize: 17,
                                          ),
                                          const Spacer(),
                                          CupertinoSwitch(
                                            value: controller
                                                .isShowAvailableEvents.value,
                                            onChanged: (value) {
                                              controller
                                                  .setIsShowAvailableEvents(
                                                      value);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextWidget(
                                    text: AppStrings.category,
                                    fontColor: AppColors.contentSecondaryLight,
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  DropdownButtonFormFieldWidget(
                                      label: AppStrings.selectProductCategory,
                                      onChanged: (p0) {
                                        controller.selectProductCategory(p0);
                                      },
                                      items: const []),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  const TextWidget(
                                    text: AppStrings.brand,
                                    fontColor: AppColors.contentSecondaryLight,
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  DropdownButtonFormFieldWidget(
                                      label: AppStrings.chooseBrand,
                                      onChanged: (p0) {
                                        controller.selectBrand(p0);
                                      },
                                      items: const []),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  const TextWidget(
                                    text: AppStrings.priceRange,
                                    fontColor: AppColors.contentSecondaryLight,
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFieldWidget(
                                            controller:
                                                controller.minPriceController,
                                            labelText: AppStrings.minPrice),
                                      ),
                                      const SpaceWidget(
                                        spaceWidth: 10,
                                      ),
                                      Expanded(
                                        child: TextFieldWidget(
                                            controller:
                                                controller.maxPriceController,
                                            labelText: AppStrings.maxPrice),
                                      )
                                    ],
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  const TextWidget(
                                    text: AppStrings.type,
                                    fontColor: AppColors.contentSecondaryLight,
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  DropdownButtonFormFieldWidget(
                                      label: AppStrings.selectProductType,
                                      onChanged: (p0) {
                                        controller.selectProductType(p0);
                                      },
                                      items: const []),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  const TextWidget(
                                    text: AppStrings.availability,
                                    fontColor: AppColors.contentSecondaryLight,
                                  ),
                                  const SpaceWidget(
                                    spaceHeight: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.greyLight),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          const TextWidget(
                                            text:
                                                AppStrings.showinStockitemsonly,
                                            fontColor:
                                                AppColors.contentPrimaryLight,
                                            fontSize: 17,
                                          ),
                                          const Spacer(),
                                          CupertinoSwitch(
                                            value: controller
                                                .isShowInStockItems.value,
                                            onChanged: (value) {
                                              controller.setInStockItems(value);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        const SpaceWidget(
                          spaceHeight: 30,
                        ),
                        ButtonWidget(
                          buttonWidth: double.infinity,
                          label: AppStrings.applyFilters,
                          onPressed: () {},
                        ),
                        const SpaceWidget(
                          spaceHeight: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ]))),
    );
  }
}
