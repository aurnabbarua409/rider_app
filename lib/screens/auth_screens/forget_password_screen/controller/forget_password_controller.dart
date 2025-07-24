import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:trackdays_planner/routes/app_routes.dart';

class ForgetPasswordController extends GetxController {
  final emailController = TextEditingController();

  void sendResetLink() {
    Get.toNamed(AppRoutes.setNewPasswordScreen);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }
}
