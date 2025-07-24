import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_icon_path.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/profile_screen/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:trackdays_planner/widgets/appbar_widget/appbar_widget.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        centerTitle: true,
        title: TextWidget(
          text: AppStrings.editProfile,
          fontColor: AppColors.contentPrimaryLight,
          fontSize: 20,
        ),
      ),
      body: GetBuilder(
        init: EditProfileController(),
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppImagePath.person),
                      radius: 60,
                    ),
                    SpaceWidget(
                      spaceHeight: 20,
                    ),
                    TextWidget(
                      text: AppStrings.personalInformation,
                      fontColor: AppColors.contentSecondaryLight,
                      fontSize: 18,
                    ),
                    SpaceWidget(
                      spaceHeight: 20,
                    ),
                    TextFieldWidget(
                        controller: controller.fullnameController,
                        labelText: AppStrings.fullName),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.emailController,
                        labelText: AppStrings.email),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.phoneNumberController,
                        labelText: AppStrings.phoneNumber),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.dateOfBirthController,
                        labelText: AppStrings.dateOfBirth),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.racingNumberController,
                        labelText: AppStrings.racingNumber),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.biographyController,
                        labelText: AppStrings.biography),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Divider(
                      color: AppColors.greyLight,
                    ),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextWidget(
                      text: AppStrings.addressDetails,
                      fontColor: AppColors.contentSecondaryLight,
                      fontSize: 18,
                    ),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.countryController,
                        labelText: AppStrings.country),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.streetController,
                        labelText: AppStrings.streetName),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.aptSuiteUnitController,
                              labelText: AppStrings.aptSuiteUnit),
                        ),
                        SpaceWidget(
                          spaceWidth: 10,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.additionalController,
                              labelText: AppStrings.additional),
                        )
                      ],
                    ),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.stateProvinceController,
                              labelText: AppStrings.stateProvince),
                        ),
                        SpaceWidget(
                          spaceWidth: 10,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.cityTownController,
                              labelText: AppStrings.cityTown),
                        )
                      ],
                    ),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.zipPostalCodeController,
                        labelText: AppStrings.zipPostalCode),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Divider(
                      color: AppColors.greyLight,
                    ),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextWidget(
                      text: AppStrings.socialMedia,
                      fontColor: AppColors.contentSecondaryLight,
                      fontSize: 18,
                    ),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.facebookUrlController,
                      labelText: AppStrings.facebookUrl,
                      suffixIcon: AppIconPath.facebookIcon,
                    ),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.instagramUrlController,
                      labelText: AppStrings.instagramUrl,
                      suffixIcon: AppIconPath.instagramIcon,
                    ),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.tiktokUrlController,
                      labelText: AppStrings.tiktokUrl,
                      suffixIcon: AppIconPath.tiktokIcon,
                    ),
                    SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.linkedinUrlController,
                      labelText: AppStrings.linkedinUrl,
                      suffixIcon: AppIconPath.linkedinIcon,
                    ),
                    SpaceWidget(
                      spaceHeight: 20,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 40),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.contentSecondaryLight)),
                child: ButtonWidget(label: AppStrings.update),
              )
            ],
          ),
        ),
      ),
    );
  }
}
