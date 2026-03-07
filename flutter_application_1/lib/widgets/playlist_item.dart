import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {
  final String title; // Para "Mix diario 1"
  final String subtitle;
  final String imageUrl;
  final Color? labelColor;

  const PlaylistItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  height: 160,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),

              if (title.isNotEmpty)
                Positioned(
                  bottom: 12,
                  left: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: labelColor ?? Colors.green,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 160,
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            )
          ),
        ],
      ),
    );
  }
}
