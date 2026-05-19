class RestaurantModel {
  final String name;
  final String tags;
  final String rating;
  final String deliveryPrice;
  final String deliveryTime;
  final String imageUrl;

  const RestaurantModel({
    required this.name,
    required this.tags,
    required this.rating,
    required this.deliveryPrice,
    required this.deliveryTime,
    required this.imageUrl,
  });
}