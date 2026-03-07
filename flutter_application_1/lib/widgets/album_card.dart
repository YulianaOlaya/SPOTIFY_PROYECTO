import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final String imageUrl, title, type, artist;
  
  const AlbumCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.type,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imageUrl,
              height: 155,
              width: 155,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            type, 
            style: const TextStyle(color: Colors.grey, fontSize: 12)
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            artist,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }
}