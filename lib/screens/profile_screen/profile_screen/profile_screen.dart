import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_icon_path.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/routes/app_routes.dart';
import 'package:trackdays_planner/screens/profile_screen/profile_screen/widget/profile_app_bar_widget.dart';
import 'package:trackdays_planner/screens/profile_screen/profile_screen/widget/profile_item_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileAppBarWidget(),
            const SpaceWidget(
              spaceHeight: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(AppImagePath.person),
                      ),
                      SpaceWidget(
                        spaceWidth: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "David Brown",
                            fontColor: AppColors.contentPrimaryLight,
                            textAlignment: TextAlign.left,
                            fontSize: 20,
                          ),
                          SpaceWidget(
                            spaceHeight: 10,
                          ),
                          TextWidget(
                            text: "davidbr@gmail.com",
                            fontColor: AppColors.contentSecondaryLight,
                            textAlignment: TextAlign.left,
                            fontSize: 18,
                          )
                        ],
                      )
                    ],
                  ),
                  const SpaceWidget(
                    spaceHeight: 30,
                  ),
                  const TextWidget(
                    text: AppStrings.general,
                    fontColor: AppColors.contentSecondaryLight,
                    fontSize: 18,
                  ),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.editProfileScreen),
                    child: const ProfileItemWidget(
                        icon: AppIconPath.profileIcon,
                        label: AppStrings.editProfile),
                  ),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  const ProfileItemWidget(
                      icon: AppIconPath.couponIcon,
                      label: AppStrings.purchaseTicket),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  const ProfileItemWidget(
                      icon: AppIconPath.orderConfirmationIcon,
                      label: AppStrings.orderHistory),
                  const SpaceWidget(
                    spaceHeight: 10,
                  ),
                  const Divider(),
                  const SpaceWidget(
                    spaceHeight: 10,
                  ),
                  const TextWidget(
                    text: AppStrings.management,
                    fontColor: AppColors.contentSecondaryLight,
                    fontSize: 18,
                  ),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  const ProfileItemWidget(
                      icon: AppIconPath.notificationRedIcon,
                      label: AppStrings.notificationSetting),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  const ProfileItemWidget(
                      icon: AppIconPath.advertisementIcon,
                      label: AppStrings.advertisementManagement),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  const ProfileItemWidget(
                      icon: AppIconPath.eventIcon,
                      label: AppStrings.vehicleManagement),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  const ProfileItemWidget(
                      icon: AppIconPath.lapTimeIcon, label: AppStrings.lapTime),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  const ProfileItemWidget(
                      icon: AppIconPath.imageIcon,
                      label: AppStrings.photoAlbum),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  const ProfileItemWidget(
                      icon: AppIconPath.sponsorIcon,
                      label: AppStrings.sponsors),
                  const SpaceWidget(
                    spaceHeight: 10,
                  ),
                  const Divider(
                    color: AppColors.greyLight,
                  ),
                  const SpaceWidget(
                    spaceHeight: 20,
                  ),
                  const ProfileItemWidget(
                      icon: AppIconPath.logoutIcon, label: AppStrings.logout),
                  const SpaceWidget(
                    spaceHeight: 10,
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
