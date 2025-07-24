import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SetNewPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }
}
