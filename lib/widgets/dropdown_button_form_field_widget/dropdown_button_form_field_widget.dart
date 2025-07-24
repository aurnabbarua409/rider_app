import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:trackdays_planner/constants/app_colors.dart';

class DropdownButtonFormFieldWidget extends StatelessWidget {
  const DropdownButtonFormFieldWidget(
      {super.key,
      required this.label,
      required this.onChanged,
      required this.items,
      this.width,
      this.filled = false,
      this.fillColor // Add this line
      });

  final String label;
  final List<DropdownMenuItem<String>> items;
  final void Function(String) onChanged;
  final double? width;
  final bool? filled;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: DropdownButtonFormField<String>(
        hint: Text(label),
        decoration: InputDecoration(
          filled: filled,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.greyLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.greyLight),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
        items: items,
        onChanged: (value) {
          onChanged(value!);
        },
      ),
    );
  }
}
