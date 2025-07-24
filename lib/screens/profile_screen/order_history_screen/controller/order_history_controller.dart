import 'package:get/get.dart';
import 'package:trackdays_planner/constants/app_image_path.dart';
import 'package:trackdays_planner/models/card_item_model.dart';
import 'package:trackdays_planner/models/event_item_model.dart';

class OrderHistoryController extends GetxController {
  final RxList<CartItemModel> cartItem = <CartItemModel>[].obs;
  final RxList<EventItemModel> eventItem = <EventItemModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cartItem.value = [
      CartItemModel(
          name: "FR performance",
          description: "Bridgestone",
          price: 245.00,
          quantity: 2,
          imageUrl: AppImagePath.gearUpImage1,
          brandImageUrl: AppImagePath.frPerformanceImage)
    ];
    eventItem.value = [
      EventItemModel("APR", "25", "MON", "FR-Perfomance", "Most, 435", 1, 89.95)
    ];
  }
}
