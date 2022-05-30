// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:food_ui/data/data.dart';
import 'package:food_ui/models/restaurant.dart';
import 'package:food_ui/screens/cart_screen.dart';
import 'package:food_ui/screens/restaurant_screen.dart';
import 'package:food_ui/widgets/rating_stars.dart';
import 'package:food_ui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_circle,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Food Delivery',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 5),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartSceen(),
                ),
              ),
              child: Text(
                'Cart (${currentUser.cart.length})',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    width: 0.8,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                hintText: 'Search Food or Restaurant',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: IconButton(
                  onPressed: (() {}),
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          const RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  'Nearby Restaurant',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              _buildRestaurants()
            ],
          )
        ],
      ),
    );
  }

  _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantScreen(
                  restaurant: restaurant,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.grey[200]!,
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                      image: AssetImage(
                        restaurant.imageUrl,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        RatingStars(
                          ratings: restaurant.rating,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          restaurant.address,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "0.2 miles away",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }
}
