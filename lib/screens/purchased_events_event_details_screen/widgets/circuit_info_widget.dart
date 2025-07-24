import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/image_widget/image_widget.dart';
import '../../../widgets/space_widget/space_widget.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class CircuitInfoWidget extends StatelessWidget {
  final String meters;
  final String leftTurns;
  final String rightTurns;
  final String imagePath;

  const CircuitInfoWidget({
    super.key,
    required this.meters,
    required this.leftTurns,
    required this.rightTurns,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            children: [
              TextWidget(
                text: meters,
                fontSize: 16,
                fontColor: AppColors.contentPrimaryLight,
                fontWeight: FontWeight.w400,
              ),
              const SpaceWidget(spaceWidth: 12),
              TextWidget(
                text: leftTurns,
                fontSize: 16,
                fontColor: AppColors.contentPrimaryLight,
                fontWeight: FontWeight.w400,
              ),
              const SpaceWidget(spaceWidth: 12),
              TextWidget(
                text: rightTurns,
                fontSize: 16,
                fontColor: AppColors.contentPrimaryLight,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SpaceWidget(spaceHeight: 16),
          ImageWidget(
            height: 200,
            width: double.infinity,
            imagePath: imagePath,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
