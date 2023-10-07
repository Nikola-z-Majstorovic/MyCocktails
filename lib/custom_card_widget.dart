import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String imageName;
  final String name;
  final String category;
  final bool isFavorite;
  final bool hasWarning;

  const CustomCardWidget({
    super.key,
    required this.imageName,
    required this.name,
    required this.category,
    this.isFavorite = false,
    this.hasWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
        ),
        child: Row(
          children: [
            // Left Side (Image and Info)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image(
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageName,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Category:',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    category,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            // Right Side (Favorite Icon and Warning)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Favorite Icon
                Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.grey,
                  size: 30.0,
                ),
                const SizedBox(height: 16.0),
                // Warning Icon
                Image.asset(
                  "assets/icons/settings_alert.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
