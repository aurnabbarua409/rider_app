import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AllEventsEventDetailsScreenController extends GetxController {
  // TextEditingControllers for the text fields
  final insuranceNameController = TextEditingController();
  final insuranceNumberController = TextEditingController();

  // Dropdown value
  final selectedTravelMethod = 'Car'.obs;
  final travelMethods = ['Car', 'Bike', 'Public Transport', 'Walking'];

  // Checkbox value
  final isOver16 = false.obs;

  void submitForm() {
    print('Form Submitted:');
    print('Insurance Name: $insuranceNameController');
    print('Insurance Number: $insuranceNumberController');
    print('Travel Method: ${selectedTravelMethod.value}');
    print('Is Over 16: ${isOver16.value}');
    Get.back(); // Close the bottom sheet
  }

  void skipForm() {
    Get.back(); // Close the bottom sheet
  }
}
