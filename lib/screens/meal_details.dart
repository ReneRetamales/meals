import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
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
            const SizedBox(height: 14),
            Text(
              "Ingredientes",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            /* Esta linea de abajo es para mostrar info */
            for (final ingredient in meal.ingredients) Text(ingredient),
            const SizedBox(height: 14),
            Text(
              "Pasos",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            /* Esta linea de abajo es para mostrar info */
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Text(step, textAlign: TextAlign.center),
              ),
          ],
        ),
      ),
    );
  }
}
