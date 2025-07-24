import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/routes/app_routes.dart';

class RegisterScreenController extends GetxController {
  // Observable for checkbox state
  RxBool isChecked = false.obs;

  // TextEditingControllers for form fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Function to toggle checkbox
  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  // Function to handle registration
  void register() {
    if (!isChecked.value) {
      Get.snackbar(
        'Agreement Required',
        'Please agree to the Terms & Conditions and Privacy Policy.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Add your registration logic here
    // Example: Validate form fields and proceed
    String fullName = fullNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar(
        'Form Incomplete',
        'Please fill in all fields.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
        'Password Mismatch',
        'Passwords do not match.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Proceed with registration (e.g., API call, navigation, etc.)
    Get.offNamed(
        AppRoutes.loginScreen); // Replace with your actual registration logic
  }

  @override
  void onClose() {
    // Dispose of controllers
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
