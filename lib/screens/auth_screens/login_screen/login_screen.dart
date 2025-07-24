import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icon_path.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_size.dart';
import '../../../widgets/button_widget/button_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key}) {
    Get.put(LoginScreenController());
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginScreenController>();

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
                text: AppStrings.welcomeBack.tr,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontColor: AppColors.contentPrimaryLight,
                textAlignment: TextAlign.left,
              ),
              const SpaceWidget(spaceHeight: 8),
              TextWidget(
                text: AppStrings.loginDescription.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontColor: AppColors.contentSecondaryLight,
                textAlignment: TextAlign.left,
              ),
              const SpaceWidget(spaceHeight: 32),
              // Login form fields
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
              const SpaceWidget(spaceHeight: 32),
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
                  text: AppStrings.dontHaveAccount.tr,
                  style: TextStyle(
                    fontSize: ResponsiveUtils.width(16),
                    color: AppColors.contentTertiaryLight,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: AppStrings.register.tr,
                      style: TextStyle(
                        color: AppColors.mainBrandColor,
                        decoration: TextDecoration.underline,
                        fontSize: ResponsiveUtils.width(16),
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.registerScreen);
                        },
                    ),
                  ],
                ),
              ),
              const SpaceWidget(spaceHeight: 16),
              ButtonWidget(
                onPressed: controller.login,
                label: AppStrings.login.tr,
                textColor: AppColors.white,
                fontSize: 16,
                buttonWidth: double.infinity,
                buttonHeight: 56,
                buttonRadius: BorderRadius.circular(100),
                backgroundColor: AppColors.mainBrandColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
