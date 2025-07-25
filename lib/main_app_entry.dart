import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'routes/route_manager.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppSize.size =
          MediaQueryData.fromView(WidgetsBinding.instance.window).size;
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.mainBrandColor),
          useMaterial3: true,
          fontFamily: AppStrings.fontFamilyName,
        ),
        initialRoute: RouteManager.initial,
        getPages: RouteManager.getPages(),
      );
    });
  }
}
