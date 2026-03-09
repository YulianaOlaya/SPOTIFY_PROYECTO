import 'package:flutter/material.dart';


class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76, 
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF5D4037), 
          borderRadius: BorderRadius.circular(
            12,
          ), 
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        'https://i.scdn.co/image/ab67616d0000b273277620423172f5a151f452e3',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lillium (From "Elfen Lied")',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Geek Music',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.devices_other,
                      color: Colors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF1DB954),
                      size: 22,
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.play_arrow, color: Colors.white, size: 30),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 2,
                  width: 40, 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
