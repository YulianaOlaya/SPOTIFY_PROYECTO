import 'package:flutter/material.dart';

class MusicCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String description;
  final String songsCount;
  final Color color;

  const MusicCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.songsCount,
    required this.color,
  }); 


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 190,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen
              ClipRRect(
                // ESTE REDONDEA LA IMAGEN
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              // Texto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.white70),
            ],
          ),

          const SizedBox(height: 8),

          Text.rich(
             TextSpan(
              children: [
                TextSpan(
                  text: "$songsCount canciones · ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: description,
                ),
              ],
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),

          const Spacer(),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.volume_up_outlined, size: 16, color: Colors.white70),
                    SizedBox(width: 4),
                    Text(
                      "Obtener avance de la playlist",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    Container(
                      width: 14,
                      height: 3,
                      color: Colors.white,
                    ),

                    Container(
                      width: 3, 
                      height: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
