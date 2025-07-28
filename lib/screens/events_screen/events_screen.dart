import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/screens/events_screen/widgets/browse_all_events_widget.dart';
import 'package:trackdays_planner/screens/events_screen/widgets/event_screen_appbar_widget.dart';
import 'package:trackdays_planner/screens/events_screen/widgets/gearup_for_this_event_widget.dart';
import 'package:trackdays_planner/screens/events_screen/widgets/your_racing_timeline_widget.dart';
import 'package:universal_stepper/universal_stepper.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_image_path.dart';
import '../../constants/app_strings.dart';
import '../../routes/app_routes.dart';
import '../../widgets/button_widget/button_widget.dart';
import '../../widgets/image_widget/image_widget.dart';
import '../../widgets/space_widget/space_widget.dart';
import '../../widgets/text_field_widget/text_field_widget.dart';
import '../../widgets/text_widget/text_widgets.dart';
import '../all_events_event_details_screen/controller/all_events_event_details_screen_controller.dart';
import '../all_events_event_details_screen/widgets/age_checkbox_widget.dart';
import '../all_events_event_details_screen/widgets/travel_method_dropdown_widget.dart';
import '../notifications_screen/widgets/tab_button_widget.dart';
import '../product_screen/widgets/product_screen_appbar_widget.dart';
import 'widgets/your_purchased_event_widget.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final TextEditingController searchController = TextEditingController();

  final List<String> upcomingImages = [
    AppImagePath.upcomingImage,
    AppImagePath.upcomingImage,
    AppImagePath.upcomingImage,
  ];

  final List<String> months = [
    "JAN",
    "FEB",
    "MAR",
  ];

  final List<String> dates = [
    "12",
    "13",
    "14",
  ];

  final List<String> days = [
    "MON",
    "TUES",
    "WED",
  ];

  final List<String> name = [
    "Circuit de Valencia Ricardo Tormo",
    "Most Autodrom",
    "Circuit de Valencia Ricardo Tormo",
  ];

  final List<String> countries = [
    "Spanje",
    "Tsjechië",
    "Tsjechië",
  ];

  final List<String> types = [
    "New",
    "Expired",
    "Sold Out",
  ];

  int activeStep = 2;

  final List<String> prices = [
    "€699.00",
    "€579.00",
    "€699.00",
  ];

  int currentStep = 2;

  StepperBadgePosition badgePosition = StepperBadgePosition.center;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllEventsEventDetailsScreenController());
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      body: Column(
        children: [
          EventScreenAppbarWidget(
            searchController: searchController,
            notificationLabel: '3',
            cartLabel: '1',
            tabController: _tabController,
          ),
          
          const SpaceWidget(spaceHeight: 24),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // All Events Tab
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 24, bottom: 8),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextWidget(
                                text: AppStrings.gearupForTheseEvents.tr,
                                fontColor: AppColors.contentPrimaryLight,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const SpaceWidget(spaceHeight: 12),
                            ...List.generate(
                              upcomingImages.length,
                              (index) => GearupForThisEventWidget(
                                imagePath: upcomingImages[index],
                                month: months[index],
                                day: dates[index],
                                weekday: days[index],
                                eventName: name[index],
                                location: countries[index],
                                time: '16:00 - 18:30',
                                temperature: '23°',
                                laps: '14 T',
                                price: prices[index],
                                badgeText: types[index],
                                badgeTextColor: types[index] == "New"
                                    ? AppColors.green
                                    : types[index] == "Expired"
                                        ? AppColors.gold
                                        : AppColors.mainBrandColor,
                                badgeTextBgColor: types[index] == "New"
                                    ? AppColors.green.withOpacity(0.1)
                                    : types[index] == "Expired"
                                        ? AppColors.yellow.withOpacity(0.1)
                                        : AppColors.mainBrandColor
                                            .withOpacity(0.1),
                                onPressed: () {
                                  Get.toNamed(
                                      AppRoutes.allEventsEventDetailsScreen);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 24),

                      // Ads Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: const ImageWidget(
                            height: 160,
                            width: double.infinity,
                            imagePath: AppImagePath.adsImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 24),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextWidget(
                          text: AppStrings.browseAllEvents.tr,
                          fontColor: AppColors.contentPrimaryLight,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 12),
                      ...List.generate(
                        upcomingImages.length,
                        (index) => BrowseAllEventsWidget(
                          imagePath: upcomingImages[index],
                          month: months[index],
                          day: dates[index],
                          weekday: days[index],
                          eventName: name[index],
                          location: countries[index],
                          time: '16:00 - 18:30',
                          temperature: '23°',
                          laps: '14 T',
                          price: prices[index],
                          badgeText: types[index],
                          badgeTextColor: types[index] == "New"
                              ? AppColors.green
                              : types[index] == "Expired"
                                  ? AppColors.gold
                                  : AppColors.mainBrandColor,
                          badgeTextBgColor: types[index] == "New"
                              ? AppColors.green.withOpacity(0.1)
                              : types[index] == "Expired"
                                  ? AppColors.yellow.withOpacity(0.1)
                                  : AppColors.mainBrandColor.withOpacity(0.1),
                          onPressed: () {
                            Get.toNamed(AppRoutes.allEventsEventDetailsScreen);
                          },
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 12),
                    ],
                  ),
                ),

                // Purchased Events Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextWidget(
                                text: AppStrings.yourPurchasedEvents.tr,
                                fontColor: AppColors.contentPrimaryLight,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const SpaceWidget(spaceHeight: 12),
                            ...List.generate(3, (index) {
                              return YourPurchasedEventWidget(
                                image: AppImagePath.upcomingImage,
                                month: "APR",
                                date: "12",
                                day: "MON",
                                eventName: "Circuit de Valencia Ricardo Tormo",
                                location: "Spanje",
                                time: "16:00 - 18:30",
                                temperature: "23°",
                                laps: "14 T",
                                badgeText: types[index],
                                badgeTextColor: types[index] == "New"
                                    ? AppColors.green
                                    : types[index] == "Expired"
                                        ? AppColors.gold
                                        : AppColors.mainBrandColor,
                                badgeTextBgColor: types[index] == "New"
                                    ? AppColors.green.withOpacity(0.1)
                                    : types[index] == "Expired"
                                        ? AppColors.yellow.withOpacity(0.1)
                                        : AppColors.mainBrandColor
                                            .withOpacity(0.1),
                                activeStep: activeStep,
                                onStepReached: (index) {
                                  setState(() {
                                    activeStep = index;
                                  });
                                },
                                stepIcons: const [
                                  Icons.confirmation_num_outlined,
                                  Icons.location_on_outlined,
                                  Icons.person_add_alt_outlined,
                                  Icons.flag_outlined,
                                  Icons.emoji_events_outlined,
                                ],
                                activeStepIcons: const [
                                  Icons.confirmation_num_outlined,
                                  Icons.location_on_outlined,
                                  Icons.person_add_alt_outlined,
                                  Icons.flag_outlined,
                                  Icons.emoji_events_outlined,
                                ],
                                finishedStepIcons: const [
                                  Icons.confirmation_num_outlined,
                                  Icons.location_on_outlined,
                                  Icons.person_add_alt_outlined,
                                  Icons.flag_outlined,
                                  Icons.emoji_events_outlined,
                                ],
                                fillFormOnPressed: () {
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
                                                padding:
                                                    const EdgeInsets.all(13),
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .contentSecondaryLight
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
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
                                              controller: controller
                                                  .insuranceNameController,
                                              labelText:
                                                  AppStrings.insuranceName.tr,
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
                                            Obx(() =>
                                                TravelMethodDropdownWidget(
                                                  value: controller
                                                      .selectedTravelMethod
                                                      .value,
                                                  onChanged: (value) {
                                                    if (value != null) {
                                                      controller
                                                          .selectedTravelMethod
                                                          .value = value;
                                                    }
                                                  },
                                                  items:
                                                      controller.travelMethods,
                                                )),
                                            const SpaceWidget(spaceHeight: 16),
                                            // Checkbox
                                            Obx(() => AgeCheckboxWidget(
                                                  value:
                                                      controller.isOver16.value,
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
                                                    onPressed:
                                                        controller.submitForm,
                                                    label: AppStrings.submit.tr,
                                                    buttonWidth: 188,
                                                  ),
                                                ),
                                                const SpaceWidget(
                                                    spaceWidth: 16),
                                                Expanded(
                                                  flex: 1,
                                                  child: ButtonWidget(
                                                    onPressed:
                                                        controller.skipForm,
                                                    label: AppStrings.skip.tr,
                                                    buttonWidth: 188,
                                                    backgroundColor:
                                                        AppColors.white,
                                                    borderColor: AppColors
                                                        .mainBrandColor,
                                                    textColor: AppColors
                                                        .mainBrandColor,
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
                                viewDetailsOnPressed: () {
                                  Get.toNamed(AppRoutes
                                      .purchasedEventsEventDetailsScreen);
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextWidget(
                          text: AppStrings.yourRacingTimeline.tr,
                          fontColor: AppColors.contentPrimaryLight,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SpaceWidget(spaceHeight: 12),
                      ...List.generate(3, (index) {
                        return YourRacingTimelineWidget(
                          image: AppImagePath.upcomingImage,
                          month: "APR",
                          date: "12",
                          day: "MON",
                          eventName: "Circuit de Valencia Ricardo Tormo",
                          location: "Spanje",
                          time: "16:00 - 18:30",
                          temperature: "23°",
                          laps: "14 T",
                          badgeText: types[index],
                          badgeTextColor: types[index] == "New"
                              ? AppColors.green
                              : types[index] == "Expired"
                                  ? AppColors.gold
                                  : AppColors.mainBrandColor,
                          badgeTextBgColor: types[index] == "New"
                              ? AppColors.green.withOpacity(0.1)
                              : types[index] == "Expired"
                                  ? AppColors.yellow.withOpacity(0.1)
                                  : AppColors.mainBrandColor.withOpacity(0.1),
                          activeStep: activeStep,
                          onStepReached: (index) {
                            setState(() {
                              activeStep = index;
                            });
                          },
                          stepIcons: const [
                            Icons.confirmation_num_outlined,
                            Icons.location_on_outlined,
                            Icons.person_add_alt_outlined,
                            Icons.flag_outlined,
                            Icons.emoji_events_outlined,
                          ],
                          activeStepIcons: const [
                            Icons.confirmation_num_outlined,
                            Icons.location_on_outlined,
                            Icons.person_add_alt_outlined,
                            Icons.flag_outlined,
                            Icons.emoji_events_outlined,
                          ],
                          finishedStepIcons: const [
                            Icons.confirmation_num_outlined,
                            Icons.location_on_outlined,
                            Icons.person_add_alt_outlined,
                            Icons.flag_outlined,
                            Icons.emoji_events_outlined,
                          ],
                          viewDetailsOnPressed: () {
                            Get.toNamed(
                                AppRoutes.purchasedEventsEventDetailsScreen);
                          },
                        );
                      }),
                      const SpaceWidget(spaceHeight: 24),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
