import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/resources/color.dart';
import '../../configs/resources/size copy.dart';
import 'custom_text.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textFieldController;
  final String labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final Color borderColor;
  final double borderRadius;
  final Color hintColor;
  final Color inputTextColor;
  final AutovalidateMode autovalidateMode;
  final Color borderErrorColor;
  final Color errorColor;
  final VoidCallback? suffixIconOnPressed;
  final String? textHintRequirements;
  final bool enabled; // Properti baru

  const CustomTextFormField({
    super.key,
    this.textFieldController,
    required this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.borderColor = ColorConfig.borderColor,
    this.borderRadius = 10.0,
    this.hintColor = ColorConfig.textColor,
    this.inputTextColor = Colors.black,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.borderErrorColor = ColorConfig.redErrorColor,
    this.errorColor = ColorConfig.redErrorColor,
    this.suffixIconOnPressed,
    this.textHintRequirements,
    this.enabled = true, // Default true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.s08.w),
          child: CustomText(
            text: labelText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: SizeConfig.s04.h,
        ),
        TextFormField(
          controller: textFieldController,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          enabled: enabled,
          style: TextStyle(
            fontFamily: 'Fors',
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: enabled ? inputTextColor : hintColor,
          ),
          validator: validator,
          autovalidateMode: autovalidateMode,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Fors',
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: hintColor,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            errorStyle: TextStyle(
              color: errorColor,
              fontFamily: 'Fors',
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
            errorMaxLines: 2,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderErrorColor, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderErrorColor, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            counterText: "", // Hide the length counter
          ),
        ),
        SizedBox(
          height: SizeConfig.s04.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.s13.w),
          child: textHintRequirements != null
              ? CustomText(
                  text: textHintRequirements!,
                  fontSize: 12,
                  color: ColorConfig.lightBlack,
                  fontWeight: FontWeight.normal,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
