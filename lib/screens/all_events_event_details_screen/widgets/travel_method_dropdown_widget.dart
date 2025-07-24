import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/app_size.dart';

class TravelMethodDropdownWidget extends StatelessWidget {
  final String value;
  final void Function(String?) onChanged;
  final List<String> items;

  const TravelMethodDropdownWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      dropdownColor: AppColors.white,
      onChanged: onChanged,
      items: items.map((method) {
        return DropdownMenuItem<String>(
          value: method,
          child: Text(method),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Your Travel Method',
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding: EdgeInsets.all(ResponsiveUtils.width(18)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.greyLight,
            width: ResponsiveUtils.width(1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.secondBrandColor,
            width: ResponsiveUtils.width(1),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.red400,
            width: ResponsiveUtils.width(1),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.red400,
            width: ResponsiveUtils.width(1),
          ),
        ),
      ),
    );
  }
}
