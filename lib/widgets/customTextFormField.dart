import 'package:flutter/material.dart';

// constants
import 'package:notes_app/constants.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({super.key, required this.hint, this.maxLines = 1, this.onSaved, this.onChanged});

  final String hint;
  final int maxLines;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required!";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
