import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/auth_screens/forget_password_screen/controller/forget_password_controller.dart';
import 'package:trackdays_planner/widgets/appbar_widget/appbar_widget.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      appBar: const AppbarWidget(
        backgroundColor: AppColors.thirdBrandColor,
        title: Text(""),
      ),
      body: GetBuilder(
        init: ForgetPasswordController(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: AppStrings.forgotPassword,
                fontColor: AppColors.contentPrimaryLight,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SpaceWidget(
                spaceHeight: 10,
              ),
              const TextWidget(
                text: AppStrings.forgetPasswordDetails,
                fontColor: AppColors.contentSecondaryLight,
                textAlignment: TextAlign.left,
                fontSize: 16,
                softwrap: true,
              ),
              const SpaceWidget(
                spaceHeight: 30,
              ),
              TextFieldWidget(
                  controller: controller.emailController,
                  labelText: AppStrings.email),
              const Spacer(),
              ButtonWidget(
                label: "Send Reset Link",
                buttonWidth: double.infinity,
                onPressed: controller.sendResetLink,
              )
            ],
          ),
        ),
      ),
    );
  }
}
