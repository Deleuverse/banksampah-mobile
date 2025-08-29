import 'package:bank_sampah/app/core/widgets/shimmer_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/resources/color.dart';


class CircleNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  const CircleNetworkImage({
    super.key,
    required this.imageUrl,
    required this.size,
    this.showBorder = false,
    this.borderColor = ColorConfig.white,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: size.w,
        height: size.h,
        fit: BoxFit.cover,
        placeholder: (context, url) => ShimmerUtil.shimmerEffect(
          child: Container(
            width: size.w,
            height: size.h,
            color: ColorConfig.borderColor,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: size.w,
          height: size.h,
          color: Colors.grey[300],
          child: Icon(
            Icons.broken_image,
            size: (size * 0.4).clamp(12.0, 32.0).sp,
            color: Colors.grey[600],
          ),
        ),
      ),
    );

    if (!showBorder) return image;

    return Container(
      padding: EdgeInsets.all(borderWidth.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth.w,
        ),
      ),
      child: image,
    );
  }
}
