import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/app_size.dart';
import '../../../widgets/button_widget/button_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';

class PurchasedActionRowWidget extends StatelessWidget {
  final VoidCallback fillFormOnPressed;
  final VoidCallback sellTicketOnTap;

  const PurchasedActionRowWidget({
    super.key,
    required this.fillFormOnPressed,
    required this.sellTicketOnTap,
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
          Expanded(
            flex: 1,
            child: ButtonWidget(
              onPressed: fillFormOnPressed,
              label: AppStrings.fill.tr,
              buttonHeight: 56,
              buttonWidth: ResponsiveUtils.width(270),
            ),
          ),
          const SpaceWidget(spaceWidth: 16),
          Expanded(
            flex: 1,
            child: ButtonWidget(
              onPressed: sellTicketOnTap,
              label: AppStrings.sellTicket.tr,
              buttonHeight: 56,
              backgroundColor: AppColors.white,
              borderColor: AppColors.mainBrandColor,
              textColor: AppColors.mainBrandColor,
              buttonWidth: ResponsiveUtils.width(270),
            ),
          ),
        ],
      ),
    );
  }
}
