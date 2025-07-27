import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

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

  final Rx<XFile?> pickedImage = Rx<XFile?>(null);
  final ImagePicker _picker = ImagePicker();
  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!, // Or use `BuildContext context` as a parameter
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );

    if (pickedDate != null) {
      dateOfBirthController.text =
          pickedDate.toLocal().toString().split(' ')[0];

      if (kDebugMode) {
        print(dateOfBirthController.text);
      }
    }
  }

  Future<void> pickImage(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const TextWidget(
                text: 'Take Photo',
                fontColor: AppColors.contentPrimaryLight,
                textAlignment: TextAlign.left,
                fontSize: 16,
              ),
              onTap: () async {
                Navigator.pop(context);
                final image =
                    await _picker.pickImage(source: ImageSource.camera);
                pickedImage.value = image;
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const TextWidget(
                text: 'Choose from Gallery',
                fontColor: AppColors.contentPrimaryLight,
                textAlignment: TextAlign.left,
                fontSize: 16,
              ),
              onTap: () async {
                Navigator.pop(context);
                final image =
                    await _picker.pickImage(source: ImageSource.gallery);
                pickedImage.value = image;
              },
            ),
          ],
        );
      },
    );
  }

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
