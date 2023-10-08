import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String imageName;
  final String name;
  final String category;
  final bool isFavorite;
  final bool hasWarning;
  final Function() onTap;

  const CustomCardWidget({
    super.key,
    required this.imageName,
    required this.name,
    required this.category,
    this.isFavorite = false,
    this.hasWarning = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Row(
          children: [
            Image.network(
              width: 80.0,
              height: 80.0,
              imageName,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Image.asset(
                  'assets/pictures/No_picture_available.png',
                  width: 80.0,
                  height: 80.0,
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onTap,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                ),
                const SizedBox(height: 22.0),
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
