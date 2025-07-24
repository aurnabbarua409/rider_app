import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/routes/app_routes.dart';
import 'package:trackdays_planner/utils/app_size.dart';
import 'package:trackdays_planner/widgets/button_widget/button_widget.dart';
import 'package:trackdays_planner/widgets/image_widget/image_widget.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icon_path.dart';
import '../../constants/app_strings.dart';
import '../../widgets/appbar_widget/appbar_widget.dart';
import '../../widgets/icon_widget/icon_widget.dart';
import '../../widgets/space_widget/space_widget.dart';
import '../../widgets/text_widget/text_widgets.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdBrandColor,
      appBar: AppbarWidget(
        centerTitle: true,
        leading: IconButton(
          tooltip: "Notifications",
          onPressed: () {},
          icon: const Badge(
            isLabelVisible: true,
            label: Text('3'),
            backgroundColor: AppColors.mainBrandColor,
            child: IconWidget(
              icon: AppIconPath.notificationIcon,
              width: 24,
              height: 24,
            ),
          ),
        ),
        action: IconButton(
          tooltip: "Cart",
          onPressed: () {
            Get.toNamed(AppRoutes.cartScreen);
          },
          icon: const Badge(
            isLabelVisible: true,
            label: Text('2'),
            backgroundColor: AppColors.mainBrandColor,
            child: IconWidget(
              icon: AppIconPath.cartIcon,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Section
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageWidget(
                    imagePath: AppImagePath.gearUpImage1,
                    height: ResponsiveUtils.height(300),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SpaceWidget(spaceHeight: 16),

              // Product Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: ResponsiveUtils.width(200),
                    child: const TextWidget(
                      text: "Bridgestone Tire",
                      fontColor: AppColors.contentPrimaryLight,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlignment: TextAlign.start,
                    ),
                  ),
                  ImageWidget(
                    imagePath: AppImagePath.brandImage1,
                    height: ResponsiveUtils.height(24),
                    width: ResponsiveUtils.width(75),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SpaceWidget(spaceHeight: 12),

              // Product Specification
              SizedBox(
                width: ResponsiveUtils.width(350),
                child: TextWidget(
                  text: "Bridgestone V02 slick Front 120/605 17 SOFT",
                  fontColor: AppColors.contentPrimaryLight.withOpacity(0.4),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlignment: TextAlign.start,
                ),
              ),
              const SpaceWidget(spaceHeight: 8),

              // Price Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const TextWidget(
                        text: "€185.00",
                        fontColor: AppColors.contentPrimaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                      ),
                      const SpaceWidget(spaceWidth: 8),
                      TextWidget(
                        text: "€185.00",
                        fontColor:
                            AppColors.contentPrimaryLight.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        decoration: TextDecoration.lineThrough,
                        decorationColor:
                            AppColors.contentPrimaryLight.withOpacity(0.5),
                      ),
                    ],
                  ),
                  const SpaceWidget(spaceHeight: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.mainBrandColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextWidget(
                      text: "30%",
                      fontColor: AppColors.mainBrandColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SpaceWidget(spaceHeight: 16),

              // Details Section
              TextWidget(
                text: AppStrings.detaile.tr,
                fontColor: AppColors.contentPrimaryLight,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              const SpaceWidget(spaceHeight: 8),

              TextWidget(
                text:
                    "Bridgestone V02 Slick Front 120/605 17 SOFT is a premium racing tire designed for high-performance motorcycles, offering exceptional grip, stability, and precise handling. Its advanced compound ensures maximum traction in dry conditions, making it perfect for professional riders pushing their limits on the track. Ideal for competitive racing, the V02 Slick delivers consistent performance, improved cornering stability, and enhanced lap times.",
                fontColor: AppColors.contentPrimaryLight.withOpacity(0.5),
                fontWeight: FontWeight.w400,
                fontSize: 14,
                textAlignment: TextAlign.start,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 1),
                decoration: BoxDecoration(
                  color: AppColors.mainBrandColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: _decrementCounter,
                    ),
                    Text(
                      '$_counter',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: _incrementCounter,
                    ),
                  ],
                ),
              ),
            ),
            const SpaceWidget(spaceWidth: 12),
            Expanded(
              flex: 2,
              child: ButtonWidget(
                onPressed: () {
                  Get.toNamed(AppRoutes.cartScreen);
                },
                label: AppStrings.addToCart.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
