import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../bottom_nav_bar/bottom_nav_bar.dart';

class LoginScreenController extends GetxController {
  // TextEditingControllers for form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observable for password visibility
  RxBool isPasswordVisible = false.obs;

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Function to handle login
  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Form Incomplete',
        'Please fill in both email and password.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Add your login logic here (e.g., API call, authentication)
    // For now, navigate to home screen as a placeholder
    Get.offAll(const BottomNavScreen()); // Replace with your actual login logic
  }

  @override
  void onClose() {
    // Dispose of controllers
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
