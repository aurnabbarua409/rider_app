import 'package:get/get.dart';

import '../../../constants/app_image_path.dart';

class OnboardingContent {
  String title;
  String description;
  String image;

  OnboardingContent({
    required this.title,
    required this.image,
    required this.description,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    image: AppImagePath.onboardingImage1,
    title: "Select Your Event".tr,
    description:
        "Browse upcoming track days at top circuits, compare available dates, and choose the event that suits you best."
            .tr,
  ),
  OnboardingContent(
    image: AppImagePath.onboardingImage2,
    title: "Gear Up for the Ride".tr,
    description:
        "Explore high-quality gear, from helmets to racing suits, ensuring you’re fully equipped for maximum performance on the track."
            .tr,
  ),
  OnboardingContent(
    image: AppImagePath.onboardingImage3,
    title: "Book and Hit the Track".tr,
    description:
        "Complete your registration, confirm your spot, and get ready to experience the thrill of the track."
            .tr,
  ),
];
