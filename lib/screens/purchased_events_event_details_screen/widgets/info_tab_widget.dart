import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class InfoTabWidget extends StatelessWidget {
  final int index;
  final TabController tabController;
  final List<String> tabs;
  final VoidCallback? onUpdate;

  const InfoTabWidget({
    super.key,
    required this.index,
    required this.tabController,
    required this.tabs,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = tabController.index == index;

    return GestureDetector(
      onTap: () {
        tabController.animateTo(index);
        onUpdate?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.mainBrandColor : Colors.transparent,
              width: 3.0,
            ),
          ),
        ),
        child: TextWidget(
          text: tabs[index],
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontColor: isSelected ? AppColors.contentPrimaryLight : Colors.grey,
        ),
      ),
    );
  }
}
