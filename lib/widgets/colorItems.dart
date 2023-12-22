import 'package:flutter/material.dart';

class ColorItems extends StatelessWidget {
  const ColorItems({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 24,
            backgroundColor: color,
          );
  }
}
