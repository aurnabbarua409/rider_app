import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/widgets/image_widget/image_widget.dart';

import '../../constants/app_colors.dart';
import '../../utils/app_size.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? action;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle; // Add centerTitle property
  final Color? backgroundColor;
  final Widget? leading;
  final bool showLeading;
  final Widget? title;
  final EdgeInsetsGeometry? actionsPadding;

  const AppbarWidget(
      {super.key,
      this.action,
      this.bottom,
      this.centerTitle, // Add centerTitle to constructor
      this.backgroundColor,
      this.leading,
      this.showLeading = true,
      this.title,
      this.actionsPadding});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils.initialize(context);
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      flexibleSpace: Container(color: backgroundColor ?? AppColors.white),
      //titleSpacing: showLeading ? 1 : -35,
      leading: (leading ??
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.contentPrimaryLight.withOpacity(0.7),
              size: 20,
            ),
          )),

      titleSpacing: -4,
      actions: action != null ? [action!] : null,
      title: title ??
          const ImageWidget(
            height: 24,
            width: 187,
            imagePath: AppImagePath.appLogoRed,
            fit: BoxFit.contain,
          ),
      bottom: bottom,
      // Add bottom to AppBar
      centerTitle: centerTitle,
      actionsPadding: actionsPadding, // Set centerTitle in AppBar
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
