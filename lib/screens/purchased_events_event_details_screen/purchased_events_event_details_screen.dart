import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/all_events_event_details_screen/widgets/age_checkbox_widget.dart';
import 'package:trackdays_planner/screens/all_events_event_details_screen/widgets/circuit_info_widget.dart';
import 'package:trackdays_planner/screens/all_events_event_details_screen/widgets/event_faq_widget.dart';
import 'package:trackdays_planner/screens/all_events_event_details_screen/widgets/info_tab_widget.dart';
import 'package:trackdays_planner/screens/all_events_event_details_screen/widgets/stat_widget.dart';
import 'package:trackdays_planner/screens/all_events_event_details_screen/widgets/travel_method_dropdown_widget.dart';
import 'package:trackdays_planner/screens/purchased_events_event_details_screen/controller/purchased_events_event_details_screen_controller.dart';
import 'package:trackdays_planner/screens/purchased_events_event_details_screen/widgets/purchased_action_row_widget.dart';
import 'package:trackdays_planner/screens/purchased_events_event_details_screen/widgets/purchased_tab_contant_widget.dart';
import 'package:trackdays_planner/screens/purchased_events_event_details_screen/widgets/stepper_data.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/date_badge_widget/date_badge_widget.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';
import 'package:universal_stepper/universal_stepper.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icon_path.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_size.dart';
import '../../widgets/appbar_widget/appbar_widget.dart';
import '../../widgets/custom_stepper_widget/vertical_custom_stepper_widget.dart';
import '../../widgets/icon_widget/icon_widget.dart';
import '../../widgets/image_widget/image_widget.dart';
import '../../widgets/space_widget/space_widget.dart';
import '../../widgets/text_widget/text_widgets.dart';

class PurchasedEventsEventDetailsScreen extends StatefulWidget {
  const PurchasedEventsEventDetailsScreen({super.key});

  @override
  State<PurchasedEventsEventDetailsScreen> createState() =>
      _PurchasedEventsEventDetailsScreenState();
}

class _PurchasedEventsEventDetailsScreenState
    extends State<PurchasedEventsEventDetailsScreen>
    with SingleTickerProviderStateMixin {
  // Tabs
  late TabController _tabController;
  final List<String> _tabs = ['Information', 'Circuit', 'Map', 'FAQ'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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

  int currentStep = 2;

  StepperBadgePosition badgePosition = StepperBadgePosition.center;

  bool isInverted = false;

  List<StepperData> stepperData = [
    const StepperData(
      title: "Booking Confirmed",
      subtitle: "April 5, 2025",
    ),
    const StepperData(
      title: "Check-in at Circuit",
      subtitle: "April 10, 2025",
    ),
    const StepperData(
      title: "Group Assignment",
      subtitle: "April 10, 2025",
    ),
    const StepperData(
      title: "Practice Session",
      subtitle: "April 10, 2025",
    ),
    const StepperData(
      title: "Race Day",
      subtitle: "April 11, 2025",
    ),
  ];

  //  For image pageviewa

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PurchasedEventsEventDetailsScreenController());
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      appBar: AppbarWidget(
        centerTitle: true,
        action: IconButton(
          tooltip: "Cart",
          onPressed: () {
            Get.toNamed(AppRoutes.cartScreen);
          },
          icon: const Badge(
            isLabelVisible: true,
            label: Text('2'),
            backgroundColor: AppColors.mainBrandColor,
            child: IconWidget(
              icon: AppIconPath.cartIcon,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Image
                SizedBox(
                  height: ResponsiveUtils.height(350),
                  child: PageView(
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ImageWidget(
                          imagePath: AppImagePath.upcomingImage,
                          height: ResponsiveUtils.height(350),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ImageWidget(
                          imagePath: AppImagePath.qrCodeImage,
                          height: ResponsiveUtils.height(350),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                // Date badge
                if (_currentPageIndex == 0)
                  const Positioned(
                    top: 8,
                    left: 8,
                    child: DateBadgeWidget(
                      month: "APR",
                      date: "25",
                      day: "MON",
                    ),
                  ),
              ],
            ),
            const SpaceWidget(spaceHeight: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWidget(
                imagePath: AppImagePath.brandImage2,
                height: ResponsiveUtils.height(17),
                width: ResponsiveUtils.width(120),
                fit: BoxFit.contain,
              ),
            ),
            const SpaceWidget(spaceHeight: 16),
            const SizedBox(
              width: double.infinity,
              child: TextWidget(
                text: "FR-Performance (Autodrom Most)",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontColor: AppColors.contentPrimaryLight,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlignment: TextAlign.start,
              ),
            ),
            const SpaceWidget(spaceHeight: 12),
            Row(
              children: [
                const IconWidget(
                  icon: AppIconPath.newRecordIcon,
                  width: 24,
                  height: 24,
                ),
                const SpaceWidget(spaceWidth: 12),
                SizedBox(
                  width: ResponsiveUtils.width(300),
                  child: TextWidget(
                    text: "Most, 435 13 Czech Republic",
                    fontColor: AppColors.contentPrimaryLight.withOpacity(0.7),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlignment: TextAlign.start,
                  ),
                ),
              ],
            ),
            const SpaceWidget(spaceHeight: 12),
            const Row(
              children: [
                StatWidget(
                  icon: Icons.device_thermostat_outlined,
                  text: "23°",
                ),
                SpaceWidget(spaceWidth: 16),
                StatWidget(
                  icon: Icons.loop,
                  text: "14 T",
                ),
                SpaceWidget(spaceWidth: 16),
                StatWidget(
                  icon: Icons.access_time,
                  text: "16:00 - 18:30",
                ),
              ],
            ),
            const SpaceWidget(spaceHeight: 32),

            // New Stepper Package
            VerticalCustomStepperWidget(
              inverted: false,
              stepperDirection: Axis.vertical,
              titles: stepperData.map((e) => e.title).toList(),
              subtitles: stepperData.map((e) => e.subtitle).toList(),
              elementCount: stepperData.length,
              dashedLineColor: AppColors.mainBrandColor,
              containerColor: AppColors.white,
              borderColor: AppColors.contentPrimaryLight.withOpacity(0.10),
              activeIconColor: AppColors.white,
              inactiveIconColor: AppColors.mainBrandColor.withOpacity(0.40),
              activeBadgeColor: AppColors.mainBrandColor,
              inactiveBadgeColor: AppColors.white,
              activeBorderColor: AppColors.mainBrandColor,
              inactiveBorderColor: AppColors.mainBrandColor.withOpacity(0.40),
              activeTextColor: AppColors.contentPrimaryLight,
              inactiveTextColor: AppColors.contentPrimaryLight.withOpacity(0.5),
              activeSubtitleColor:
                  AppColors.contentPrimaryLight.withOpacity(0.5),
              inactiveSubtitleColor:
                  AppColors.contentPrimaryLight.withOpacity(0.3),
              currentStep: currentStep,
              stepIcons: const [
                Icons.confirmation_number_outlined,
                Icons.location_on_outlined,
                Icons.person_add_alt_outlined,
                Icons.flag_outlined,
                Icons.emoji_events_outlined,
              ],
              badgePosition: badgePosition,
            ),

            // Tab bar
            Container(
              margin: const EdgeInsets.only(top: 24),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE0E0E0),
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  _tabs.length,
                  (index) => InfoTabWidget(
                    index: index,
                    tabController: _tabController,
                    tabs: _tabs,
                    onUpdate: () => setState(() {}),
                  ),
                ),
              ),
            ),

            // Tab content - directly build the relevant content based on tab index
            PurchasedTabContentWidget(
              tabController: _tabController,
              informationTabContent: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextWidget(
                  text:
                      "This weekend is designed for everyone who wants to optimally prepare for their first race weekend of 2025 – \namong like-minded people and with the goal of leaving on Sunday faster, more consistent, or safer than they arrived on Thursday evening.Get into your rhythm on Friday, test new things during Saturday's training sessions, solidify them in the afternoon 2-hour race, and go all out in the sprint race on Sunday As always, you don’t have to worry about hidden costs with us. Transponders, timekeeping, and live timing are included in the price.  You will receive breakfast for yourself and your companions from Friday to Sunday, and on Saturday evening, we’ll grill sausages for you and provide a keg of beer.",
                  fontColor: AppColors.contentPrimaryLight.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlignment: TextAlign.start,
                ),
              ),
              circuitTabContent: const CircuitInfoWidget(
                meters: "4211 Meters",
                leftTurns: "7 Left Turns",
                rightTurns: "8 Right Turns",
                imagePath: AppImagePath.mapImage,
              ),
              mapTabContent: const CircuitInfoWidget(
                meters: "4211 Meters",
                leftTurns: "7 Left Turns",
                rightTurns: "8 Right Turns",
                imagePath: AppImagePath.mapImage,
              ),
              faqTabContent: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(5, (index) {
                      return const EventFAQWidget(
                        titleText: "What is the event schedule?",
                        descriptionText:
                            "The event schedule will be provided closer to the event date.",
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PurchasedActionRowWidget(
        fillFormOnPressed: () {
          Get.bottomSheet(
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 100,
                        height: 4,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: AppColors.contentSecondaryLight
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    const SpaceWidget(spaceHeight: 32),
                    TextWidget(
                      text: AppStrings.fillFormText.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontColor: AppColors.contentPrimaryLight,
                    ),
                    const SpaceWidget(spaceHeight: 16),

                    // Insurance Name TextField
                    TextFieldWidget(
                      controller: controller.insuranceNameController,
                      labelText: AppStrings.insuranceName.tr,
                      maxLines: 1,
                    ),
                    const SpaceWidget(spaceHeight: 16),
                    // Insurance Number TextField
                    TextFieldWidget(
                      controller: controller.insuranceNumberController,
                      labelText: AppStrings.insuranceNumber.tr,
                      maxLines: 1,
                    ),
                    const SpaceWidget(spaceHeight: 16),
                    // Travel Method Dropdown
                    Obx(() => TravelMethodDropdownWidget(
                          value: controller.selectedTravelMethod.value,
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectedTravelMethod.value = value;
                            }
                          },
                          items: controller.travelMethods,
                        )),
                    const SpaceWidget(spaceHeight: 16),
                    // Checkbox
                    Obx(() => AgeCheckboxWidget(
                          value: controller.isOver16.value,
                          onChanged: (value) {
                            controller.isOver16.value = value ?? false;
                          },
                        )),
                    const SpaceWidget(spaceHeight: 16),
                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            borderColor: AppColors.mainBrandColor,
                            textColor: AppColors.mainBrandColor,
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
        sellTicketOnTap: () {},
      ),
    );
  }
}
