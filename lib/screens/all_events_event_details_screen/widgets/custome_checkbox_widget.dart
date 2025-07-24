import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class CustomCheckboxWidget extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  final String text;

  const CustomCheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.mainBrandColor,
              side: const BorderSide(
                color: AppColors.secondBrandColor,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              checkColor: AppColors.white,
            ),
            TextWidget(
              text: text,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontColor: AppColors.contentPrimaryLight,
              textAlignment: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
