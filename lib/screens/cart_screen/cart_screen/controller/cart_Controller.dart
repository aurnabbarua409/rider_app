import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/models/card_item_model.dart';
import 'package:trackdays_planner/models/event_item_model.dart';

class CartController extends GetxController {
  final RxList<EventItemModel> eventItem = <EventItemModel>[].obs;
  final RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    eventItem.value = [
      EventItemModel("APR", "25", "Mon", "FR-Performance (Autodrom Most)",
          "Most, 435 13 Czech Republic", 1, 89.95)
    ];
    cartItems.value = [
      CartItemModel(
          name: "Trackdaysplanner",
          description: "Milieumat 2m x 1m",
          price: 89.95,
          quantity: 1,
          imageUrl: AppImagePath.gearUpImage2,
          brandImageUrl: AppImagePath.appLogoRed),
      CartItemModel(
          name: "Bridgestone Tire",
          description: "Bridgestone V02 slick Front...",
          price: 370.00,
          quantity: 2,
          imageUrl: AppImagePath.gearUpImage1,
          brandImageUrl: AppImagePath.frPerformanceImage),
    ];
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  }
}
