import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';

class ProductController extends GetxController {
  // Reactive variable to track the number of items to show
  var itemsToShow = 6.obs; // Initially show 6 items

  // Best Selling Products data
  final List<String> bestSellingImages = [
    AppImagePath.gearUpImage1,
    AppImagePath.gearUpImage2,
    AppImagePath.gearUpImage1,
  ].obs;
  final List<String> bestSellingBrandImages = [
    AppImagePath.brandImage1,
    AppImagePath.brandImage2,
    AppImagePath.brandImage1,
  ].obs;
  final List<String> bestSellingNames = [
    'Bridgestone',
    'Trackdaysplanner',
    'Bridgestone',
  ].obs;
  final List<String> bestSellingDetails = [
    'Bridgestone V02 slick',
    'Milieumat 2m x 1m',
    'Bridgestone V02 slick',
  ].obs;
  final List<String> bestSellingPrices = [
    '€245.00',
    '€89.95',
    '€245.00',
  ].obs;

  // Shop Top Products data
  final List<String> shopTopImages = [
    AppImagePath.gearUpImage1,
    AppImagePath.gearUpImage2,
    AppImagePath.gearUpImage1,
    AppImagePath.gearUpImage2,
    AppImagePath.gearUpImage1,
    AppImagePath.gearUpImage2,
    AppImagePath.gearUpImage1,
    AppImagePath.gearUpImage2,
    AppImagePath.gearUpImage1,
    AppImagePath.gearUpImage2,
    AppImagePath.gearUpImage1,
    AppImagePath.gearUpImage2,
  ];
  final List<String> shopTopBrandImages = [
    AppImagePath.brandImage1,
    AppImagePath.brandImage2,
    AppImagePath.brandImage1,
    AppImagePath.brandImage2,
    AppImagePath.brandImage1,
    AppImagePath.brandImage2,
    AppImagePath.brandImage1,
    AppImagePath.brandImage2,
    AppImagePath.brandImage1,
    AppImagePath.brandImage2,
    AppImagePath.brandImage1,
    AppImagePath.brandImage2,
  ];
  final List<String> shopTopName = [
    'Bridgestone',
    'Trackdaysplanner',
    'Bridgestone',
    'Trackdaysplanner',
    'Bridgestone',
    'Trackdaysplanner',
    'Bridgestone',
    'Trackdaysplanner',
    'Bridgestone',
    'Trackdaysplanner',
    'Bridgestone',
    'Trackdaysplanner',
  ];
  final List<String> shopTopDetails = [
    'Bridgestone V02 slick',
    'Milieumat 2m x 1m',
    'Bridgestone V02 slick',
    'Milieumat 2m x 1m',
    'Bridgestone V02 slick',
    'Milieumat 2m x 1m',
    'Bridgestone V02 slick',
    'Milieumat 2m x 1m',
    'Bridgestone V02 slick',
    'Milieumat 2m x 1m',
    'Bridgestone V02 slick',
    'Milieumat 2m x 1m',
  ];
  final List<String> shopTopPrices = [
    '€245.00',
    '€89.95',
    '€245.00',
    '€89.95',
    '€245.00',
    '€89.95',
    '€245.00',
    '€89.95',
    '€245.00',
    '€89.95',
    '€245.00',
    '€89.95',
  ];

  // Function to load more items
  void loadMoreItems() {
    itemsToShow.value += 6; // Add 6 more items
    if (itemsToShow.value > shopTopImages.length) {
      itemsToShow.value = shopTopImages.length; // Cap at total items
    }
  }
}
