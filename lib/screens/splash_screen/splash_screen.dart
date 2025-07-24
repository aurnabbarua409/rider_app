import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_colors.dart';

import '../../constants/app_image_path.dart';
import '../../widgets/image_widget/image_widget.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final splashController = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.mainBrandColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImagePath.splashScreen),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: ImageWidget(
                imagePath: AppImagePath.appLogoWhite,
                height: 180,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
