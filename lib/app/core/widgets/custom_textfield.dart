import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../configs/resources/color.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.enabled,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.style,
    this.label,
    this.isRequired = false,
    this.labelonTop = false,
    this.labelStyle,
    this.hint,
    this.hintStyle = const TextStyle(color: Color(0xFFD6D6D6)),
    this.maxLines = 1,
    this.minLines,
    this.textHelper = "",
    this.helperStyle,
    this.maxLength,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.prefixStyle,
    this.obscureText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.isPasswordField = false,
    this.onTap,
    this.readOnly = false,
    this.decoration,
    this.height,
    this.onChange,
    this.textAlign = TextAlign.start,
    this.contentPadding = 16.0,
    this.autoFocus = false,
    this.inputBorder,
  }) : super(key: key);

  final bool? enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onFieldSubmitted;
  final TextStyle? style;
  final String? label;
  final bool isRequired;
  final bool labelonTop;
  final TextStyle? labelStyle;
  final String? hint;
  final TextStyle? hintStyle;
  final int? maxLines;
  final int? minLines;
  final String textHelper;
  final TextStyle? helperStyle;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final bool? obscureText;
  final AutovalidateMode? autovalidateMode;
  final bool isPasswordField;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final InputDecoration? decoration;
  final double? height;
  final ValueChanged<String>? onChange;
  final TextAlign textAlign;
  final double contentPadding;
  final bool autoFocus;
  final InputBorder? inputBorder;
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.labelonTop)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Visibility(
              visible: widget.isRequired,
              replacement: Text(
                widget.label!.tr,
                style: widget.labelStyle ?? TextStyle(color: const Color(0xFF5A5B5D), fontSize: 14.sp),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: widget.label!.tr,
                        style: widget.labelStyle ?? TextStyle(color: const Color(0xFF5A5B5D), fontSize: 14.sp)),
                    TextSpan(text: " *", style: TextStyle(color: Colors.red, fontSize: 14.sp))
                  ],
                ),
              ),
            ),
          ),
        SizedBox(
          height: widget.height,
          child: TextFormField(
            readOnly: widget.readOnly,
            enabled: widget.enabled,
            autofocus: widget.autoFocus,
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign,
            textInputAction: _textInputAction(),
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatters,
            onFieldSubmitted: widget.onFieldSubmitted ?? _onFieldSubmited,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            validator: widget.validator,
            onChanged: widget.onChange,
            style: widget.style,
            obscureText: widget.obscureText ?? _obscureText,
            autovalidateMode: widget.autovalidateMode,
            decoration: widget.decoration ??
                InputDecoration(
                  counterText: '',
                  helperText: widget.textHelper.tr,
                  filled: true,
                  fillColor: ColorConfig.white,
                  helperMaxLines: 3,
                  helperStyle: widget.helperStyle,
                  counterStyle: const TextStyle(fontSize: 0),
                  border: widget.inputBorder ??
                      OutlineInputBorder(

                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: ColorConfig.primary[300]!, width: 1),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: ColorConfig.black, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: ColorConfig.borderColor, width: 1),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: Colors.red,
                      )),
                  errorStyle: TextStyle(
                    color: ColorConfig.redErrorColor,
                    fontFamily: 'Fors',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  prefixText: widget.prefixText,
                  prefixStyle: widget.prefixStyle,
                  labelText: !widget.labelonTop ? widget.label : null,
                  hintText: widget.hint?.tr,
                  hintStyle: widget.hintStyle,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 15.h),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon ?? _eyeIcon(),
                ),
          ),
        ),
      ],
    );
  }

  Widget? _eyeIcon() {
    if (widget.isPasswordField) {
      return IconButton(
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        icon: Icon(
          _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
          color: !_obscureText ? ColorConfig.primary : Colors.grey,
          size: 16,
        ),
      );
    }
    return null;
  }

  ValueChanged<String>? _onFieldSubmited(String value) {
    if (widget.nextFocusNode != null && _textInputAction() == TextInputAction.next) {
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    }
    return null;
  }

  TextInputAction? _textInputAction() {
    if (widget.textInputAction != null) return widget.textInputAction;

    if (widget.nextFocusNode != null) return TextInputAction.next;
    return null;
  }
}
