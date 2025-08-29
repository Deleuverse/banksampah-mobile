import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/resources/color.dart';

class CustomOutlineButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;

  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? colorBorder;
  final EdgeInsets? padding;
  final dynamic shape;
  final double? height;

  const CustomOutlineButton({
    super.key,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(10),
    ),
    this.onPressed,
    this.child = const SizedBox(),
    this.backgroundColor,
    this.shape,
    this.colorBorder,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.transparent,
        side: BorderSide(
          color: colorBorder == null ? ColorConfig.black : colorBorder!,
        ),
        padding: padding ?? EdgeInsets.all(0),
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10.r),
            ),
      ),
      child: child,
    );
  }
}
