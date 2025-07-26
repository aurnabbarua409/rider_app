import 'package:flutter/material.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget(
      {super.key,
      required this.label,
      required this.content,
      this.contentColor,
      this.contentFontSize});
  final String label;
  final String content;
  final Color? contentColor;
  final double? contentFontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextWidget(
          text: "$label:",
          fontColor: AppColors.contentPrimaryLight,
          textAlignment: TextAlign.left,
          fontSize: 17,
        )),
        const Spacer(),
        Expanded(
          child: TextWidget(
            text: content,
            fontColor: contentColor ?? AppColors.contentPrimaryLight,
            textAlignment: TextAlign.right,
            fontSize: contentFontSize ?? 17,
          ),
        )
      ],
    );
  }
}
