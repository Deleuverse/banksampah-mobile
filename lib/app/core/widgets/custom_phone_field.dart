import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';


import '../../configs/resources/color.dart';
import '../../configs/resources/size copy.dart';

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField({
    Key? key,
    required this.onChanged,
    this.initialCountryCode = 'ID',
    this.dropdownTextStyle,
    this.flagsButtonMargin,
    this.pickerDialogStyle,
    this.showCountryFlag,
    this.dropdownIconPosition,
    this.dropdownDecoration,
    this.enabled,
    this.controller,
    this.isRequired = false,
    this.label,
    this.labelStyle,
    this.readOnly=false,
    this.height,
    this.validator,
    this.contentPadding = 16.0,
    this.disableLengthCheck = false, required this.formkey,
  }) : super(key: key);

  final bool? enabled;
  final TextEditingController? controller;
  final String? initialCountryCode;
  final TextStyle? dropdownTextStyle;
  final EdgeInsets? flagsButtonMargin;
  final PickerDialogStyle? pickerDialogStyle;
  final bool? showCountryFlag;
  final IconPosition? dropdownIconPosition;
  final BoxDecoration? dropdownDecoration;
  final bool isRequired;
  final Key formkey;
  final bool readOnly;
  final TextStyle? labelStyle;
  final String? label;
  final double contentPadding;
  final Function(PhoneNumber) onChanged;
  final double? height;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final bool disableLengthCheck;

  @override
  CustomPhoneFieldState createState() => CustomPhoneFieldState();
}

class CustomPhoneFieldState extends State<CustomPhoneField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Visibility(
                  visible: widget.isRequired,
                  replacement: Text(
                    widget.label!.tr,
                    style: widget.labelStyle ?? const TextStyle(color: Color(0xFF5A5B5D), fontSize: 14),
                  ),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: widget.label!.tr,
                            style: widget.labelStyle ?? const TextStyle(color: Color(0xFF5A5B5D), fontSize: 14)),
                        const TextSpan(text: " *", style: TextStyle(color: Colors.red, fontSize: 14))
                      ])),
                )),
          Theme(
            data: ThemeData(
              disabledColor: Colors.black,
            ),
            child: SizedBox(
              height: widget.height,
              child: IntlPhoneField(
                controller: widget.controller,
                onChanged: widget.onChanged,
                disableLengthCheck: widget.disableLengthCheck,
                initialCountryCode: widget.initialCountryCode,
                validator: widget.validator,
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),
                cursorColor: Colors.black,
                readOnly: widget.readOnly,
                key: widget.formkey,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  // for below version 2 use this
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.deny(RegExp(r'^0+')),
// for version 2 and greater youcan also use this
                  FilteringTextInputFormatter.digitsOnly

                ],
                dropdownTextStyle: widget.dropdownTextStyle,
                decoration: InputDecoration(
                  counterText: '',
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(fontSize: SizeConfig.s14.sp,fontWeight: FontWeight.w300,color: ColorConfig.textColor),
                  hintText: "Enter your phone number here",
                  counterStyle: const TextStyle(fontSize: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: ColorConfig.primary[300]!, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: ColorConfig.black, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: ColorConfig.primary[300]!, width: 1),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey[500]!),
                  ),
                  contentPadding: EdgeInsets.all(widget.contentPadding),
                  // prefix vertical divider
                ),
                flagsButtonMargin: widget.flagsButtonMargin ?? const EdgeInsets.only(left: 15),
                pickerDialogStyle: widget.pickerDialogStyle ?? PickerDialogStyle(),
                dropdownIconPosition: widget.dropdownIconPosition ?? IconPosition.trailing,
                showCountryFlag: widget.showCountryFlag ?? false,
                enabled: widget.enabled ?? true,
                // dropdownIcon: const Icon(
                //   FluentIcons.caret_down_16_filled,
                //   size: 20,
                // ),
                dropdownDecoration: widget.dropdownDecoration ?? const BoxDecoration(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
