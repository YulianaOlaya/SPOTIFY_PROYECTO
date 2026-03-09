import 'package:flutter/material.dart';

class ArtistItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const ArtistItem({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CircleAvatar(
          radius: 65,
          backgroundImage: NetworkImage(imageUrl),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: 110,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}