import 'package:flutter/material.dart';
import 'package:food_ui/models/food.dart';
import 'package:food_ui/models/restaurant.dart';
import 'package:food_ui/widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  fit: BoxFit.cover,
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                    widget.restaurant.imageUrl,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      color: Colors.white,
                      iconSize: 30,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    IconButton(
                      onPressed: (() {}),
                      color: Colors.deepOrangeAccent,
                      iconSize: 35,
                      icon: const Icon(
                        Icons.favorite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'O.2 miles away',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                RatingStars(ratings: widget.restaurant.rating),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.restaurant.address,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonText(
                onPress: () {},
                text: "Review",
              ),
              ButtonText(
                onPress: () {},
                text: "Contact",
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ),
          ),
        ],
      ),
    );
  }

  _buildMenuItem(Food menuItem) {
    return Center(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                menuItem.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black87.withOpacity(0.4),
                Colors.black54.withOpacity(0.4),
                Colors.black38.withOpacity(0.4),
              ],
              stops: const [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
            ),
          ),
        ),
        Positioned(
          top: 65,
          child: Column(
            children: [
              Text(
                menuItem.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                "\$${menuItem.price}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({Key? key, required this.onPress, required this.text})
      : super(key: key);

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
