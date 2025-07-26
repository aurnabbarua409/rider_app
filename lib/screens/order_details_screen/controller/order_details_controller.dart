import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/models/card_item_model.dart';
import 'package:trackdays_planner/models/event_item_model.dart';

class OrderDetailsController extends GetxController {
  final RxList<CartItemModel> cardItem = <CartItemModel>[].obs;
  final Rxn<EventItemModel> eventItem = Rxn<EventItemModel>();
  final countryController = TextEditingController();
  final streetController = TextEditingController();
  final apiSuiteUnitController = TextEditingController();
  final additionalController = TextEditingController();
  final stateProvinceController = TextEditingController();
  final cityTownController = TextEditingController();
  final zipPostalCodeController = TextEditingController();
  final fullnameController = TextEditingController();
  final insuranceNameController = TextEditingController();
  final insuranceNumberController = TextEditingController();
  final groupController = TextEditingController();
  final pitboxController = TextEditingController();
  final paymentController = TextEditingController();
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    countryController.dispose();
    streetController.dispose();
    apiSuiteUnitController.dispose();
    additionalController.dispose();
    stateProvinceController.dispose();
    cityTownController.dispose();
    zipPostalCodeController.dispose();
    fullnameController.dispose();
    insuranceNameController.dispose();
    insuranceNumberController.dispose();
    groupController.dispose();
    pitboxController.dispose();
    paymentController.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    eventItem.value = EventItemModel(
        "APR",
        "25",
        "MON",
        "FR-Performance (Autodrom Most)",
        "Most, 435 13 Czech Reputation",
        1,
        89.95);
    cardItem.value = [
      CartItemModel(
          name: "Bridgestone",
          description: "Bridgestone",
          price: 245.00,
          quantity: 2,
          imageUrl: AppImagePath.gearUpImage1,
          brandImageUrl: AppImagePath.frPerformanceImage),
      CartItemModel(
          name: "Bridgestone",
          description: "Bridgestone",
          price: 245.00,
          quantity: 3,
          imageUrl: AppImagePath.gearUpImage1,
          brandImageUrl: AppImagePath.frPerformanceImage),
    ];
  }
}
