import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    // La taille de l'écran
    final size = MediaQuery.of(context).size;

    // La largeur des cartes
    final cardWidth = size.width / 3;

    // La hauteur des cartes
    final cardHeight = cardWidth / 2;

    return Card(
      child: Column(
        children: [
          // L'image de la carte
          Image.asset(
            image,
            width: cardWidth,
            height: cardHeight,
            fit: BoxFit.cover,
          ),
          // Le titre de la carte
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          // La description de la carte
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
