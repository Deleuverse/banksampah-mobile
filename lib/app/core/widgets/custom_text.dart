import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color color;
  final Alignment alignment;
  final TextAlign textAlign;
  final int? maxLines;
  final double? height;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final double? letterSpacing; // Tambahan

  const CustomText({
    super.key,
    this.text = '',
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'Fors',
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.maxLines,
    this.height,
    this.overflow,
    this.letterSpacing, // Tambahan
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        height: height,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing, // Tambahan
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
