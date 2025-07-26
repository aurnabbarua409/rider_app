import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FilterSearchController extends GetxController {
  final RxBool isEvent = true.obs;
  final RxString selectedCircuit = "".obs;
  final RxString selectedCity = "".obs;
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final RxString selectedOrganizer = "".obs;
  final RxString selectedRidingGroup = "".obs;
  final RxBool isShowAvailableEvents = false.obs;
  final RxString selectedProductCategory = "".obs;
  final RxString choosenBrand = "".obs;
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();
  final RxString selectedProductType = "".obs;
  final RxBool isShowInStockItems = false.obs;

  void selectIsEvent() {
    isEvent.value = !isEvent.value;
  }

  void selectCircuit(String circuit) {
    selectedCircuit.value = circuit;
  }

  void selectCity(String city) {
    selectedCity.value = city;
  }

  void selectOrganizer(String organizer) {
    selectedOrganizer.value = organizer;
  }

  void selectRidingGroup(String group) {
    selectedRidingGroup.value = group;
  }

  void setIsShowAvailableEvents(bool value) {
    isShowAvailableEvents.value = value;
  }

  void selectProductCategory(String category) {
    selectedProductCategory.value = category;
  }

  void selectBrand(String brand) {
    choosenBrand.value = brand;
  }

  void selectProductType(String type) {
    selectedProductType.value = type;
  }

  void setInStockItems(bool value) {
    isShowInStockItems.value = value;
  }

  void clearAll() {
    fromDateController.dispose();
    toDateController.dispose();
    minPriceController.dispose();
    maxPriceController.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    fromDateController.dispose();
    toDateController.dispose();
    minPriceController.dispose();
    maxPriceController.dispose();
  }
}
