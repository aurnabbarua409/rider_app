import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_icon_path.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/profile_screen/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:trackdays_planner/widgets/appbar_widget/appbar_widget.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/dropdown_button_form_field_widget/dropdown_button_form_field_widget.dart';
import 'package:trackdays_planner/widgets/icon_widget/icon_widget.dart';
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
      appBar: const AppbarWidget(
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(AppImagePath.person),
                            radius: 60,
                          ),
                          IconWidget(
                              height: 35, width: 35, icon: AppIconPath.editIcon)
                        ]),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    const TextWidget(
                      text: AppStrings.personalInformation,
                      fontColor: AppColors.contentSecondaryLight,
                      fontSize: 18,
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                    TextFieldWidget(
                        controller: controller.fullnameController,
                        labelText: AppStrings.fullName),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.emailController,
                        labelText: AppStrings.email),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormFieldWidget(
                              filled: true,
                              fillColor: AppColors.white,
                              label: AppStrings.nationality,
                              onChanged: (p0) {},
                              items: []),
                        ),
                        const SpaceWidget(
                          spaceWidth: 10,
                        ),
                        Expanded(
                          child: DropdownButtonFormFieldWidget(
                              filled: true,
                              fillColor: AppColors.white,
                              label: AppStrings.language,
                              onChanged: (p0) {},
                              items: []),
                        ),
                      ],
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.phoneNumberController,
                        labelText: AppStrings.phoneNumber),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.dateOfBirthController,
                      labelText: AppStrings.dateOfBirth,
                      suffixIcon: AppIconPath.calenderIcon,
                      iconColor: AppColors.mainBrandColor,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                        controller: controller.racingNumberController,
                        labelText: AppStrings.racingNumber),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.biographyController,
                      labelText: AppStrings.biography,
                      maxLines: 3,
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
                    const TextWidget(
                      text: AppStrings.addressDetails,
                      fontColor: AppColors.contentSecondaryLight,
                      fontSize: 18,
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
                              controller: controller.aptSuiteUnitController,
                              labelText: AppStrings.aptSuiteUnit),
                        ),
                        const SpaceWidget(
                          spaceWidth: 10,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                              controller: controller.additionalController,
                              labelText: AppStrings.additional),
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
                        )
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
                    const TextWidget(
                      text: AppStrings.socialMedia,
                      fontColor: AppColors.contentSecondaryLight,
                      fontSize: 18,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.facebookUrlController,
                      labelText: AppStrings.facebookUrl,
                      suffixIcon: AppIconPath.facebookIcon,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.instagramUrlController,
                      labelText: AppStrings.instagramUrl,
                      suffixIcon: AppIconPath.instagramIcon,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.tiktokUrlController,
                      labelText: AppStrings.tiktokUrl,
                      suffixIcon: AppIconPath.tiktokIcon,
                    ),
                    const SpaceWidget(
                      spaceHeight: 10,
                    ),
                    TextFieldWidget(
                      controller: controller.linkedinUrlController,
                      labelText: AppStrings.linkedinUrl,
                      suffixIcon: AppIconPath.linkedinIcon,
                    ),
                    const SpaceWidget(
                      spaceHeight: 20,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 40),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.greyLight)),
                child: const ButtonWidget(label: AppStrings.update),
              )
            ],
          ),
        ),
      ),
    );
  }
}
