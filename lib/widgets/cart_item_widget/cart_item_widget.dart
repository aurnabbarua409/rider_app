import 'package:flutter/material.dart';
import 'package:trackdays_planner/constants/app_colors.dart';
import 'package:trackdays_planner/widgets/image_widget/image_widget.dart';
import 'package:trackdays_planner/widgets/space_widget/space_widget.dart';
import 'package:trackdays_planner/widgets/text_widget/text_widgets.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {super.key,
      required this.contentImageUrl,
      required this.brandImageUrl,
      required this.quantity,
      required this.price,
      required this.description,
      required this.name});
  final String contentImageUrl;
  final String brandImageUrl;
  final int quantity;
  final double price;
  final String description;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.greyLight)),
                child: ImageWidget(
                    height: 100, width: 100, imagePath: contentImageUrl),
              ),
              Badge(
                backgroundColor: AppColors.mainBrandColor,
                textColor: AppColors.white,
                label: TextWidget(
                  text: quantity.toString(),
                  fontColor: AppColors.white,
                ),
              )
            ],
          ),
          const SpaceWidget(
            spaceHeight: 10,
          ),
          ImageWidget(height: 12, width: 100, imagePath: brandImageUrl),
          const SpaceWidget(
            spaceHeight: 5,
          ),
          TextWidget(
            text: name,
            fontColor: AppColors.contentPrimaryLight,
            fontSize: 15,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SpaceWidget(
            spaceHeight: 5,
          ),
          TextWidget(
            text: "€$price",
            fontColor: AppColors.contentPrimaryLight,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
