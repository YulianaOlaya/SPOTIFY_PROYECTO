import 'package:flutter/material.dart';

class DescubreCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String category;

  const DescubreCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              image,
              height: 140,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          // Categoria (Sencillo)
          Text(
            category,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 2),

          // Título
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 2),

          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}