class CartItemModel {
  String name;
  String description;
  double price;
  int quantity;
  String imageUrl;
  String brandImageUrl;

  CartItemModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.imageUrl,
      required this.brandImageUrl});
}