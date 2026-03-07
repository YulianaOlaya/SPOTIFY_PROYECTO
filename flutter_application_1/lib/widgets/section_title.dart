import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isSubtitle;
  const SectionTitle({super.key, required this.title, this.isSubtitle = false});

  @override
  Widget build(BuildContext context) {
    TextStyle estilo = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
    );
    double paddingTop = 20;

    if (isSubtitle) {
      estilo = const TextStyle(
        color: Colors.grey,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      );
      paddingTop = 10;
    }

    return Padding(
      padding: EdgeInsets.only(left: 16, top: paddingTop, bottom: 12),
      child: Text(title, style: estilo),
    );
  }
}