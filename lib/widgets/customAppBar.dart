import 'package:flutter/material.dart';

// widgets
import 'package:notes_app/widgets/customIcon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon, this.onPressed});

  final String title;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        const Spacer(),
        CustomIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
