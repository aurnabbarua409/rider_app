import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icon_path.dart';
import '../../utils/app_size.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final String? suffixIcon;
  final TextInputType? keyboardType;
  final int maxLines; // Add maxLines as a parameter
  final VoidCallback? onTapSuffix;
  final bool? read;
  final Color? iconColor;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      this.validator,
      this.suffixIcon,
      this.keyboardType,
      this.read = false,
      this.maxLines = 1, // Default value is 1
      this.onTapSuffix,
      this.iconColor});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    // Initialize obscureText based on suffixIcon being a password toggle
    obscureText = widget.suffixIcon == AppIconPath.visibilityOnIcon;
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils.initialize(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        readOnly: widget.read!,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: obscureText,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        style: const TextStyle(
          color: AppColors.contentPrimaryLight,
        ),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          fillColor: AppColors.white,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: AppColors.contentSecondaryLight,
            fontWeight: FontWeight.w400,
            fontSize: ResponsiveUtils.width(15),
          ),
          suffixIcon: widget.suffixIcon != null
              ? widget.suffixIcon == AppIconPath.visibilityOnIcon
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: SvgPicture.asset(
                          obscureText
                              ? AppIconPath.visibilityOnIcon
                              : AppIconPath.visibilityOffIcon,
                          color: AppColors.contentSecondaryLight,
                          height: ResponsiveUtils.width(18),
                          width: ResponsiveUtils.width(18),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(13),
                      child: SvgPicture.asset(
                        widget.suffixIcon!,
                        color:
                            widget.iconColor ?? AppColors.contentPrimaryLight,
                        height: ResponsiveUtils.width(18),
                        width: ResponsiveUtils.width(18),
                      ),
                    )
              : null,
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
      ),
    );
  }
}
