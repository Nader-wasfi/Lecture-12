import 'package:flutter/material.dart';
import 'models/category_model.dart';
import 'models/restaurant_model.dart';
import 'widgets/category_card.dart';
import 'widgets/restaurant_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategoryId = 'all';

  final List<CategoryModel> categories = const [
    CategoryModel(id: 'all', title: 'All', emoji: '🔥'),
    CategoryModel(id: 'pizza', title: 'Pizza', emoji: '🍕'),
    CategoryModel(id: 'Foul', title: 'Foul', emoji: '🥙'),
    CategoryModel(id: 'hotdog', title: 'Hot Dog', emoji: '🌭'),
    CategoryModel(id: 'burger', title: 'Burger', emoji: '🍔'),
  ];

  final List<RestaurantModel> restaurants = const [
    RestaurantModel(
      name: 'Foul And Falafel',
      tags: 'Foul & Falafel, Sandwiches, Falafel',
      rating: '4.7',
      deliveryPrice: 'Free',
      deliveryTime: '20 min',
      imageUrl: 'https://images.unsplash.com/photo-1541518763669-27fef04b14ea?q=80&w=600&auto=format&fit=crop',
    ),
    RestaurantModel(
      name: 'Pizza',
      tags: 'Margherita Mozzarella Cheese - Fresh Tomato Sauce',
      rating: '4.5',
      deliveryPrice: 'Free',
      deliveryTime: '15 min',
      imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=600&auto=format&fit=crop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFF6F6F6),
                        child: IconButton(
                          icon: const Icon(Icons.menu, color: Colors.black),
                          onPressed: () {
                            print('Menu Pressed');
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Menu',
                            style: TextStyle(color: Color(0xFFFF7A30), fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Row(
                            children: const [
                              Text('Nader', style: TextStyle(color: Colors.black87, fontSize: 16)),
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFF181C2E),
                        child: IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                          onPressed: () {
                            print('Cart Pressed');
                          },
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(color: Color(0xFFFF7A30), shape: BoxShape.circle),
                          child: const Text('7', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  children: [
                    TextSpan(text: 'Hey Nader, ', style: TextStyle(fontWeight: FontWeight.w300)),
                    TextSpan(text: 'Good Evening!', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: const Color(0xFFF6F6F6), borderRadius: BorderRadius.circular(16)),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search dishes, restaurants',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('All Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () => print('See All Categories'),
                    child: Row(
                      children: const [
                        Text('See All', style: TextStyle(color: Colors.grey)),
                        Icon(Icons.arrow_forward_ios, size: 10, color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 55,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    return CategoryCard(
                      category: cat,
                      isSelected: selectedCategoryId == cat.id,
                      onTap: () {
                        setState(() {
                          selectedCategoryId = cat.id;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Open Restaurants', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () => print('See All Restaurants'),
                    child: Row(
                      children: const [
                        Text('See All', style: TextStyle(color: Colors.grey)),
                        Icon(Icons.arrow_forward_ios, size: 10, color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: restaurants.length,
                separatorBuilder: (context, index) => const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  return RestaurantCard(restaurant: restaurants[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}