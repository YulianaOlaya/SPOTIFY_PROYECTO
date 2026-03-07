import 'package:flutter/material.dart';


class Music_Card extends StatelessWidget {
  final String imageUrl, artists;
  const Music_Card({super.key, required this.imageUrl, required this.artists});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 155,
              width: 155,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            artists,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}