import 'package:flutter/material.dart';

// constants
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});

  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                : const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
