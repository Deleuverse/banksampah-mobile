import 'package:flutter/material.dart';

import '../configs/resources/color.dart';

class DecimalCore {
  String removeDecimalPrice(double price) {
    return price < 1
        ? price.toStringAsFixed(6)
        : price < 10
            ? price.toStringAsFixed(5)
            : price < 100
                ? price.toStringAsFixed(4)
                : price.toStringAsFixed(2);
  }

  String removeDecimalPercent(double percent24) {
    return percent24 > 10000 ? percent24.toStringAsFixed(0) : percent24.toStringAsFixed(2);
  }

  Color percentChangesColor(double percent24) {
    return percent24 < 0
        ? ColorConfig.error
        : percent24 > 0
            ? ColorConfig.green
            : ColorConfig.color100;
  }
}
