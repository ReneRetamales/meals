import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Image.network(
        meal.imageUrl,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
        /* Este código permite que WIKIMEDIA no me detecte como bot 
        al solicitar acceso a las imágenes */
        headers: const {
          'User-Agent': 'MiAppDeRecetas/1.0 (contacto@tuemail.com)',
        },
        errorBuilder: (ctx, err, stack) => const Icon(Icons.fastfood),
      ),
    );
  }
}
