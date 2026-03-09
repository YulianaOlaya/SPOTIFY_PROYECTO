import 'package:flutter/material.dart';

class RecienteCardG extends StatelessWidget {
  final String imageUrl;
  final String subtitle;

  const RecienteCardG({
    super.key,
    required this.imageUrl,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 10), // separación entre tarjetas
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Imagen
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 140,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 5),

          // Subtítulo
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

