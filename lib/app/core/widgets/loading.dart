
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../configs/resources/color.dart';
import '../../configs/resources/size copy.dart';

class LoadingWidget {
  Widget circular({double? size, Color? color}) {
    return SpinKitFadingCube(
      color: color ?? ColorConfig.color50,
      size: size ?? SizeConfig.s22.r,
    );
  }
  Widget fadingCube({double? size, Color? color}) {
    return SpinKitFadingCube(
      color: color ?? ColorConfig.color50,
      size: size ?? SizeConfig.s22.r,
    );
  }

  Widget paginate() {
    return circular(size: SizeConfig.s18.r);
  }
}
