import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/dropdown_button_from_field_widget/dropdown_button_from_field_widget.dart';
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
  String? selectedValue;
  bool checkboxvalue = false;
  bool isEvents = true;
  final controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                onPressed: () {},
                text: AppStrings.clearAll,
                textColor: AppColors.mainBrandColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.mainBrandColor,
              ),
              SpaceWidget(
                spaceWidth: 16,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
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
                      border:
                          Border.all(color: AppColors.contentSecondaryLight),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: [
                      ButtonWidget(
                        onPressed: () {
                          setState(() {
                            isEvents = true;
                          });
                        },
                        label: AppStrings.events,
                        buttonWidth: MediaQuery.of(context).size.width * 0.4,
                        buttonHeight: 40,
                        buttonRadius: const BorderRadiusGeometry.all(
                          Radius.circular(10),
                        ),
                        backgroundColor:
                            isEvents ? AppColors.mainBrandColor : Colors.white,
                        textColor: isEvents
                            ? Colors.white
                            : AppColors.contentPrimaryLight,
                      ),
                      const Spacer(),
                      ButtonWidget(
                        onPressed: () {
                          setState(() {
                            isEvents = false;
                          });
                        },
                        backgroundColor:
                            isEvents ? Colors.white : AppColors.mainBrandColor,
                        textColor: isEvents
                            ? AppColors.contentPrimaryLight
                            : Colors.white,
                        label: AppStrings.products,
                        buttonWidth: MediaQuery.of(context).size.width * 0.4,
                        buttonHeight: 40,
                        buttonRadius:
                            const BorderRadiusGeometry.all(Radius.circular(10)),
                      )
                    ],
                  ),
                ),
                const SpaceWidget(
                  spaceHeight: 10,
                ),
                isEvents
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
                                child: DropdownButtonFromFieldWidget(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    label: AppStrings.selectCircuit,
                                    onChanged: (p0) {
                                      setState(() {
                                        selectedValue = p0;
                                      });
                                    },
                                    items: const [
                                      DropdownMenuItem(
                                        value: "data1",
                                        child: Text("data1"),
                                      ),
                                      DropdownMenuItem(
                                          value: "data2", child: Text("data2")),
                                      DropdownMenuItem(
                                          value: "data3", child: Text("data3"))
                                    ]),
                              ),
                              const SpaceWidget(
                                spaceWidth: 10,
                              ),
                              Expanded(
                                child: DropdownButtonFromFieldWidget(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    label: AppStrings.chooseCity,
                                    onChanged: (p0) {
                                      setState(() {
                                        selectedValue = p0;
                                      });
                                    },
                                    items: const [
                                      DropdownMenuItem(
                                        value: "data1",
                                        child: Text("data1"),
                                      ),
                                      DropdownMenuItem(
                                          value: "data2", child: Text("data2")),
                                      DropdownMenuItem(
                                          value: "data3", child: Text("data3"))
                                    ]),
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
                                  controller: controller,
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
                                  controller: controller,
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
                          DropdownButtonFromFieldWidget(
                            // selectedValue: selectedValue!,
                            label: AppStrings.chooseOrganizer,
                            onChanged: (p0) {
                              setState(() {
                                selectedValue = p0;
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "data1",
                                child: Text("Data 1"),
                              ),
                              DropdownMenuItem(
                                value: "data2",
                                child: Text("Data 2"),
                              ),
                            ],
                          ),
                          const SpaceWidget(
                            spaceHeight: 10,
                          ),
                          DropdownButtonFromFieldWidget(
                            // selectedValue: selectedValue!,
                            label: AppStrings.chooseYourRidingGroup,
                            onChanged: (p0) {
                              setState(() {
                                selectedValue = p0;
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "data1",
                                child: Text("Data 1"),
                              ),
                              DropdownMenuItem(
                                value: "data2",
                                child: Text("Data 2"),
                              ),
                            ],
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
                                border: Border.all(color: AppColors.greyLight),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const TextWidget(
                                    text: AppStrings.showAvailableEventsOnly,
                                    fontColor: AppColors.contentPrimaryLight,
                                    fontSize: 17,
                                  ),
                                  const Spacer(),
                                  CupertinoSwitch(
                                    value: checkboxvalue,
                                    onChanged: (value) {
                                      setState(() {
                                        checkboxvalue = value;
                                      });
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
                          DropdownButtonFromFieldWidget(
                              label: AppStrings.selectProductCategory,
                              onChanged: (p0) {
                                setState(() {
                                  selectedValue = p0;
                                });
                              },
                              items: const [
                                DropdownMenuItem(
                                  value: "data1",
                                  child: Text("Data1"),
                                )
                              ]),
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
                          DropdownButtonFromFieldWidget(
                              label: AppStrings.chooseBrand,
                              onChanged: (p0) {
                                setState(() {
                                  selectedValue = p0;
                                });
                              },
                              items: const [
                                DropdownMenuItem(
                                  value: "data1",
                                  child: Text("data1"),
                                )
                              ]),
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
                                    controller: controller,
                                    labelText: AppStrings.minPrice),
                              ),
                              const SpaceWidget(
                                spaceWidth: 10,
                              ),
                              Expanded(
                                child: TextFieldWidget(
                                    controller: controller,
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
                          DropdownButtonFromFieldWidget(
                              label: AppStrings.selectProductType,
                              onChanged: (p0) {
                                setState(() {
                                  selectedValue = p0;
                                });
                              },
                              items: const [
                                DropdownMenuItem(
                                  value: "data1",
                                  child: Text("data1"),
                                )
                              ]),
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
                                border: Border.all(color: AppColors.greyLight),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const TextWidget(
                                    text: AppStrings.showinStockitemsonly,
                                    fontColor: AppColors.contentPrimaryLight,
                                    fontSize: 17,
                                  ),
                                  const Spacer(),
                                  CupertinoSwitch(
                                    value: checkboxvalue,
                                    onChanged: (value) {
                                      setState(() {
                                        checkboxvalue = value;
                                      });
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
        ])));
  }
}