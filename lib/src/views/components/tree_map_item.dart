import 'package:flutter/material.dart';

class TreeMapItem extends StatelessWidget {
  final Widget child;
  final double percentage;
  final bool down;

  const TreeMapItem({
    super.key,
    required this.child,
    required this.percentage,
    required this.down,
  });

  Color getColor(double percentage) {
    int intensity = down
        ? (255 * (1 + (percentage / 100) * 2)).toInt().clamp(0, 255)
        : (255 * (1 - (percentage / 100) * 2)).toInt().clamp(0, 255);

    return down
        ? Color.fromARGB(235, intensity, 0, 0) // Vermelho
        : Color.fromARGB(255, 0, intensity, 0); // Verde
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getColor(percentage),
      child: child,
    );
  }
}
