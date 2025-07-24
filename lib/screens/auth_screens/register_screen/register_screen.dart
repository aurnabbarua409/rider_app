import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/routes/app_routes.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icon_path.dart';
import '../../../widgets/button_widget/button_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';
import 'controller/registration_screen_controller.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(RegisterScreenController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.thirdBrandColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceWidget(spaceHeight: 62),
              TextWidget(
                text: AppStrings.createAccount.tr,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontColor: AppColors.contentPrimaryLight,
                textAlignment: TextAlign.left,
              ),
              const SpaceWidget(spaceHeight: 8),
              TextWidget(
                text: AppStrings.registerDescription.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontColor: AppColors.contentSecondaryLight,
                textAlignment: TextAlign.left,
              ),
              const SpaceWidget(spaceHeight: 32),
              // Registration form fields
              TextFieldWidget(
                controller: controller.fullNameController,
                labelText: AppStrings.fullName.tr,
                maxLines: 1,
              ),
              const SpaceWidget(spaceHeight: 16),
              TextFieldWidget(
                controller: controller.emailController,
                labelText: AppStrings.email.tr,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
              ),
              const SpaceWidget(spaceHeight: 16),
              TextFieldWidget(
                controller: controller.passwordController,
                labelText: AppStrings.password.tr,
                maxLines: 1,
                suffixIcon: AppIconPath.visibilityOnIcon,
              ),
              const SpaceWidget(spaceHeight: 16),
              TextFieldWidget(
                controller: controller.confirmPasswordController,
                labelText: AppStrings.confirmPassword.tr,
                maxLines: 1,
                suffixIcon: AppIconPath.visibilityOnIcon,
              ),
              const SpaceWidget(spaceHeight: 20),
              // Checkbox and Terms & Conditions
              Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ResponsiveUtils.width(24),
                      height: ResponsiveUtils.width(24),
                      child: Checkbox(
                        value: controller.isChecked.value,
                        onChanged: (bool? value) {
                          controller.toggleCheckbox();
                        },
                        activeColor: AppColors.mainBrandColor,
                        checkColor: AppColors.white,
                        side: const BorderSide(
                          color: AppColors.mainBrandColor,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SpaceWidget(spaceWidth: 8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: AppStrings.byContinuing.tr,
                          style: TextStyle(
                            fontSize: ResponsiveUtils.width(16),
                            color: AppColors.contentTertiaryLight,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: AppStrings.termsAndConditions.tr,
                              style: TextStyle(
                                color: AppColors.mainBrandColor,
                                decoration: TextDecoration.underline,
                                fontSize: ResponsiveUtils.width(16),
                                fontWeight: FontWeight.w400,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigate to Terms & Conditions
                                  print('Terms & Conditions tapped');
                                },
                            ),
                            TextSpan(
                              text: AppStrings.and.tr,
                              style: TextStyle(
                                fontSize: ResponsiveUtils.width(16),
                                color: AppColors.contentTertiaryLight,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: AppStrings.privacyPolicy.tr,
                              style: TextStyle(
                                color: AppColors.mainBrandColor,
                                decoration: TextDecoration.underline,
                                fontSize: ResponsiveUtils.width(16),
                                fontWeight: FontWeight.w400,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigate to Privacy Policy
                                  print('Privacy Policy tapped');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  text: AppStrings.alreadyHaveAccount.tr,
                  style: TextStyle(
                    fontSize: ResponsiveUtils.width(16),
                    color: AppColors.contentTertiaryLight,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: AppStrings.login.tr,
                      style: TextStyle(
                        color: AppColors.mainBrandColor,
                        decoration: TextDecoration.underline,
                        fontSize: ResponsiveUtils.width(16),
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to Login
                          Get.offAllNamed(AppRoutes.loginScreen);
                          print('Login tapped');
                        },
                    ),
                  ],
                ),
              ),
              const SpaceWidget(spaceHeight: 16),
              Obx(
                () => ButtonWidget(
                  onPressed:
                      controller.isChecked.value ? controller.register : null,
                  // Disable button if checkbox is not checked
                  label: AppStrings.create.tr,
                  textColor: AppColors.white,
                  fontSize: 16,
                  buttonWidth: double.infinity,
                  buttonHeight: 56,
                  buttonRadius: BorderRadius.circular(100),
                  backgroundColor: controller.isChecked.value
                      ? AppColors.mainBrandColor
                      : Colors.grey, // Grey out if not checked
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
