import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final racingNumberController = TextEditingController();
  final biographyController = TextEditingController();
  final countryController = TextEditingController();
  final streetController = TextEditingController();
  final aptSuiteUnitController = TextEditingController();
  final additionalController = TextEditingController();
  final stateProvinceController = TextEditingController();
  final cityTownController = TextEditingController();
  final zipPostalCodeController = TextEditingController();
  final facebookUrlController = TextEditingController();
  final instagramUrlController = TextEditingController();
  final tiktokUrlController = TextEditingController();
  final linkedinUrlController = TextEditingController();

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    fullnameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    dateOfBirthController.dispose();
    racingNumberController.dispose();
    biographyController.dispose();
    countryController.dispose();
    streetController.dispose();
    aptSuiteUnitController.dispose();
    additionalController.dispose();
    stateProvinceController.dispose();
    cityTownController.dispose();
    zipPostalCodeController.dispose();
    facebookUrlController.dispose();
    instagramUrlController.dispose();
    tiktokUrlController.dispose();
    linkedinUrlController.dispose();
  }
}
