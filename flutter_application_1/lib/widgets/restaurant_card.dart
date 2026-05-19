import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            restaurant.imageUrl,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 160,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Text(
          restaurant.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(
          restaurant.tags,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.star, color: Color(0xFFFFB13D), size: 18),
            const SizedBox(width: 4),
            Text(restaurant.rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(width: 24),
            const Icon(Icons.local_shipping_outlined, color: Color(0xFFFFB13D), size: 18),
            const SizedBox(width: 4),
            Text(restaurant.deliveryPrice, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(width: 24),
            const Icon(Icons.access_time, color: Color(0xFFFFB13D), size: 18),
            const SizedBox(width: 4),
            Text(restaurant.deliveryTime, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      ],
    );
  }
}