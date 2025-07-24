import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/constants/app_strings.dart';
import 'package:trackdays_planner/screens/auth_screens/set_new_password_screen/controller/set_new_password_controller.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_field_widget/text_field_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: SetNewPasswordController(),
        builder: (controller) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  text: AppStrings.setNewPassword,
                  fontColor: AppColors.contentPrimaryLight,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SpaceWidget(
                  spaceHeight: 10,
                ),
                const TextWidget(
                  text: AppStrings.setNewPasswordDetails,
                  fontColor: AppColors.contentSecondaryLight,
                  textAlignment: TextAlign.left,
                ),
                const SpaceWidget(
                  spaceHeight: 25,
                ),
                TextFieldWidget(
                  controller: controller.newPasswordController,
                  labelText: AppStrings.newPassword,
                ),
                const SpaceWidget(
                  spaceHeight: 20,
                ),
                TextFieldWidget(
                  controller: controller.confirmNewPasswordController,
                  labelText: "Confirm New Password",
                ),
                const Spacer(),
                ButtonWidget(
                  label: "Reset Password",
                  buttonWidth: double.infinity,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
