import 'package:get/get.dart';
import 'package:trackdays_planner/routes/app_routes.dart';

class LanguageSelectionController extends GetxController {
  var selectedLanguage = 'English'.obs; // Reactive state for selected language

  void onLanguageChanged(String language) {
    selectedLanguage.value = language; // Update the selected language
  }

  void submit() {
    Get.toNamed(AppRoutes.onboardingScreen);
    Get.snackbar("Success", 'Selected language: ${selectedLanguage.value}');
  }
}
