import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/notifications_screen/widgets/notification_bottom_sheet_widget.dart';
import 'package:trackdays_planner/screens/notifications_screen/widgets/notification_card_widget.dart';
import 'package:trackdays_planner/screens/notifications_screen/widgets/tab_button_widget.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icon_path.dart';
import '../../routes/app_routes.dart';
import '../../widgets/appbar_widget/appbar_widget.dart';
import '../../widgets/icon_widget/icon_widget.dart';
import '../../widgets/space_widget/space_widget.dart';
import '../../widgets/text_widget/text_widgets.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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

  final List<String> icons = [
    AppIconPath.couponIcon,
    AppIconPath.newRecordIcon,
    AppIconPath.orderConfirmationIcon,
    AppIconPath.vehicleUpdateIcon,
    AppIconPath.couponIcon,
    AppIconPath.imageIcon,
  ];
  final List<String> titles = [
    "Event Reminder",
    "New Records",
    "Order Confirmation",
    "Vehicle Update Reminder",
    "New Event Published",
    "New Photo Album Uploaded",
  ];
  final List<String> desc = [
    "Your Track Day at Zandvoort is Tomorrow!",
    "You broke your new records",
    "Order Confirmed – Bridgestone V02 Slick",
    "Vehicle Update Reminder",
    "New Track Event Added: Assen TT Circuit",
    "Your Event Photos from Zolder Are Live!",
  ];

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceWidget(spaceHeight: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextWidget(
              text: AppStrings.notifications,
              fontColor: AppColors.contentPrimaryLight,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SpaceWidget(spaceHeight: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                TabButtonWidget(
                  text: AppStrings.all.tr,
                  isSelected: _tabController.index == 0,
                  onTap: () {
                    _tabController.animateTo(0);
                    setState(() {});
                  },
                ),
                const SpaceWidget(spaceWidth: 12),
                TabButtonWidget(
                  text: AppStrings.newText.tr,
                  isSelected: _tabController.index == 1,
                  onTap: () {
                    _tabController.animateTo(1);
                    setState(() {});
                  },
                ),
                const SpaceWidget(spaceWidth: 12),
                TabButtonWidget(
                  text: AppStrings.unread.tr,
                  isSelected: _tabController.index == 2,
                  onTap: () {
                    _tabController.animateTo(2);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          const SpaceWidget(spaceHeight: 24),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // All Tab
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(titles.length, (index) {
                      bool isUnread = index == 2 || index == 5;
                      return NotificationCardWidget(
                        onTap: () {
                          Get.bottomSheet(
                            NotificationBottomSheetWidget(
                              icon: icons[index],
                              title: titles[index],
                              desc: desc[index],
                              buttonOnPressed: () {
                                Get.back();
                              },
                            ),
                            isDismissible: true,
                            enableDrag: true,
                          );
                        },
                        icon: icons[index],
                        iconColor: isUnread
                            ? AppColors.mainBrandColor.withOpacity(0.40)
                            : AppColors.mainBrandColor,
                        title: titles[index],
                        fontColor: AppColors.contentPrimaryLight,
                        description: desc[index],
                        containerColor: isUnread
                            ? AppColors.thirdBrandColor
                            : AppColors.white,
                      );
                    }),
                  ),
                ),

                // New Tab
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(titles.length, (index) {
                      bool isUnread = index == 2 || index == 5;
                      return NotificationCardWidget(
                        onTap: () {
                          Get.bottomSheet(
                            NotificationBottomSheetWidget(
                              icon: icons[index],
                              title: titles[index],
                              desc: desc[index],
                              buttonOnPressed: () {
                                Get.back();
                              },
                            ),
                            isDismissible: true,
                            enableDrag: true,
                          );
                        },
                        icon: icons[index],
                        iconColor: isUnread
                            ? AppColors.mainBrandColor.withOpacity(0.40)
                            : AppColors.mainBrandColor,
                        title: titles[index],
                        fontColor: AppColors.contentPrimaryLight,
                        description: desc[index],
                        containerColor: isUnread
                            ? AppColors.thirdBrandColor
                            : AppColors.white,
                      );
                    }),
                  ),
                ),

                // Unread Tab
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(titles.length, (index) {
                      bool isUnread = index == 2 || index == 5;
                      return NotificationCardWidget(
                        onTap: () {
                          Get.bottomSheet(
                            NotificationBottomSheetWidget(
                              icon: icons[index],
                              title: titles[index],
                              desc: desc[index],
                              buttonOnPressed: () {
                                Get.back();
                              },
                            ),
                            isDismissible: true,
                            enableDrag: true,
                          );
                        },
                        icon: icons[index],
                        iconColor: isUnread
                            ? AppColors.mainBrandColor.withOpacity(0.40)
                            : AppColors.mainBrandColor,
                        title: titles[index],
                        fontColor: AppColors.contentPrimaryLight,
                        description: desc[index],
                        containerColor: isUnread
                            ? AppColors.thirdBrandColor
                            : AppColors.white,
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
