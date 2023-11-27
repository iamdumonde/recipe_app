import 'package:flutter/material.dart';
import 'restaurantcard.dart';

class RestaurantGrid extends StatelessWidget {
  const RestaurantGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // Le nombre de colonnes
      crossAxisSpacing: 10.0, // L'espacement entre les colonnes
      mainAxisSpacing: 10.0, // L'espacement entre les lignes
      padding: const EdgeInsets.all(10.0), // Le padding de la grille
      shrinkWrap: true, // Pour que la grille s'adapte à son contenu
      physics:
          const NeverScrollableScrollPhysics(), // Pour que la grille ne soit pas scrollable
      children: const [
        // Les cartes de mets de restaurant
        RestaurantCard(
          image: 'images/alex-munsell-auIbTAcSH6E-unsplash.jpg',
          title: 'Pizza',
          description: 'Une délicieuse pizza au fromage et à la tomate.',
        ),
        RestaurantCard(
          image: 'images/alex-munsell-Yr4n8O_3UPc-unsplash.jpg',
          title: 'Salade',
          description:
              'Une salade fraîche et croquante avec des légumes variés.',
        ),
        RestaurantCard(
          image: 'images/asnim-ansari-SqYmTDQYMjo-unsplash.jpg',
          title: 'Burger',
          description:
              'Un burger savoureux avec du boeuf, du fromage et de la salade.',
        ),
        RestaurantCard(
          image: 'images/brooke-lark-4J059aGa5s4-unsplash.jpg',
          title: 'Soupe',
          description:
              'Une soupe chaude et réconfortante avec des nouilles et des légumes.',
        ),
        RestaurantCard(
          image: 'images/chad-montano--GFCYhoRe48-unsplash.jpg',
          title: 'Sushi',
          description:
              'Des sushis frais et délicats avec du poisson et du riz.',
        ),
        RestaurantCard(
          image: 'images/eaters-collective-pLKgCsBOiw4-unsplash.jpg',
          title: 'Glace',
          description:
              'Une glace onctueuse et sucrée avec des fruits et du chocolat.',
        ),
      ],
    );
  }
}
