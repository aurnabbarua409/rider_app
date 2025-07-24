import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/app_size.dart';
import '../../../widgets/button_widget/button_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';

class ActionRowWidget extends StatelessWidget {
  final VoidCallback purchaseTicketOnPressed;
  final VoidCallback shareOnTap;

  const ActionRowWidget({
    super.key,
    required this.purchaseTicketOnPressed,
    required this.shareOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
            onPressed: purchaseTicketOnPressed,
            label: AppStrings.purchaseTicket.tr,
            buttonHeight: 56,
            buttonWidth: ResponsiveUtils.width(270),
          ),
          const SpaceWidget(spaceWidth: 16),
          InkWell(
            onTap: shareOnTap,
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: AppColors.red50,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.mainBrandColor),
              ),
              child: const Icon(
                Icons.share_outlined,
                color: AppColors.mainBrandColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
