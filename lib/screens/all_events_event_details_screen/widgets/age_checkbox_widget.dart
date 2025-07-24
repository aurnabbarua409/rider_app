import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/space_widget/space_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class AgeCheckboxWidget extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;

  const AgeCheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.mainBrandColor,
            checkColor: AppColors.white,
            side: const BorderSide(color: AppColors.red50),
          ),
        ),
        const SpaceWidget(spaceWidth: 8),
        TextWidget(
          text: AppStrings.age.tr,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontColor: AppColors.contentPrimaryLight.withOpacity(0.7),
        ),
      ],
    );
  }
}
