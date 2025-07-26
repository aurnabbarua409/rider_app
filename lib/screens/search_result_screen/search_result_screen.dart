import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/routes/app_routes.dart';
import 'package:trackdays_planner/screens/home_screen/widgets/gearup_for_the_track_widget.dart';
import 'package:trackdays_planner/screens/home_screen/widgets/home_screen_appbar_widget.dart';
import 'package:trackdays_planner/screens/home_screen/widgets/upcoming_track_days_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  // Demo data for events
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
    "New",
  ];

  final List<String> prices = [
    "€699.00",
    "€579.00",
    "€699.00",
  ];
  // demo data for cart items
  final List<String> gearUpImages = [
    AppImagePath.gearUpImage1,
    AppImagePath.gearUpImage2,
    AppImagePath.gearUpImage1,
  ];

  final List<String> brandImages = [
    AppImagePath.brandImage1,
    AppImagePath.brandImage2,
    AppImagePath.brandImage1,
  ];

  final List<String> gearUpName = [
    "Bridgestone",
    "Trackdaysplanner",
    "Bridgestone",
  ];

  final List<String> gearUpDetails = [
    "Bridgestone V02 slick",
    "Milieumat 2m x 1m",
    "Bridgestone V02 slick",
  ];

  final List<String> gearUpPrices = [
    "€245.00",
    "€89.95",
    "€245.00",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeScreenAppBarWidget(
              searchController: widget.searchController,
              notificationLabel: '3',
              cartLabel: '1',
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: AppStrings.searchResultsFor,
                    fontColor: AppColors.contentSecondaryLight,
                  ),
                  TextWidget(
                    text: "'${widget.searchController.text}'",
                    fontColor: AppColors.contentPrimaryLight,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    textAlignment: TextAlign.left,
                  ),
                  SpaceWidget(
                    spaceHeight: 20,
                  ),
                  TextWidget(
                    text: AppStrings.events,
                    fontColor: AppColors.contentPrimaryLight,
                    fontSize: 20,
                  ),
                  SpaceWidget(
                    spaceHeight: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        upcomingImages.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 24 : 0,
                            right: index == 2 ? 24 : 16,
                          ),
                          child: UpcomingTrackDaysWidget(
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
                                : AppColors.gold,
                            badgeTextBgColor: types[index] == "New"
                                ? AppColors.green.withOpacity(0.1)
                                : AppColors.yellow.withOpacity(0.1),
                            onPressed: () {
                              Get.toNamed(AppRoutes.productDetailScreen);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SpaceWidget(spaceHeight: 24),
                  TextWidget(
                    text: AppStrings.products,
                    fontColor: AppColors.contentPrimaryLight,
                    fontSize: 20,
                  ),
                  SpaceWidget(
                    spaceHeight: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        gearUpImages.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 24 : 0,
                            right: index == 2 ? 24 : 16,
                          ),
                          child: GearUpForTheTrackWidget(
                            imagePath: gearUpImages[index],
                            brandImagePath: brandImages[index],
                            eventName: gearUpName[index],
                            location: gearUpDetails[index],
                            price: gearUpPrices[index],
                            onPressed: () {
                              Get.toNamed(AppRoutes.productDetailScreen);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SpaceWidget(
                    spaceHeight: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
