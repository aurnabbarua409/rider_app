import 'package:flutter/material.dart';

class PurchasedTabContentWidget extends StatelessWidget {
  final TabController tabController;
  final Widget informationTabContent;
  final Widget circuitTabContent;
  final Widget mapTabContent;
  final Widget faqTabContent;

  const PurchasedTabContentWidget({
    super.key,
    required this.tabController,
    required this.informationTabContent,
    required this.circuitTabContent,
    required this.mapTabContent,
    required this.faqTabContent,
  });

  @override
  Widget build(BuildContext context) {
    // Build appropriate content based on selected tab
    switch (tabController.index) {
      case 0:
        return informationTabContent;
      case 1:
        return circuitTabContent;
      case 2:
        return mapTabContent;
      case 3:
        return faqTabContent;
      default:
        return const SizedBox.shrink();
    }
  }
}
