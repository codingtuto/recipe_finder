import 'package:flutter/material.dart';
import 'package:recipe_finder/modules/recipe/components/ingredients.dart';
import 'package:recipe_finder/widgets/texts.dart';

import '../../models/recipe/recipe.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key, required this.recipe, this.helperText});

  final Recipe? recipe;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeCard(
                title: recipe!.title,
                ingredients: recipe!.ingredients,
                instructions: recipe!.directions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String ingredients;
  final String instructions;

  const RecipeCard({
    super.key,
    required this.title,
    required this.ingredients,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextTr(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const TextTr(
              'Ingredients:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            IngredientsWidget(ingredients: ingredients),
            const SizedBox(height: 16.0),
            const TextTr(
              'Instructions:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            InstructionsWidget(instructions: instructions),
          ],
        ),
      ),
    );
  }
}
