import 'package:flutter/material.dart';

class PrimaryFormFilde extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final FocusNode? focusNode;
  final int? maxLines;

  const PrimaryFormFilde({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.obscureText,
    this.controller,
    required this.validator,
    this.focusNode, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText ?? false,
      focusNode: focusNode,
       maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          icon,
        ),
        suffixIcon: obscureText == true
            ? IconButton(
          onPressed: () {
            // Add your logic for toggling the visibility of the password
          },
          icon: const Icon(
            Icons.visibility_off,
          ),
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
