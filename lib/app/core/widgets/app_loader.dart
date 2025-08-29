import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader {
  static const Color _defaultColor = Color(0xFFFBC020);
  static const Color _secondaryColor = Color(0xFFF04400);
  static const Color _blackColor = Colors.black54;

  /// Minimal loader with smooth animation
  /// Recommended for initial list loading (e.g., when the screen first opens)
  static Widget fadingCircle({double size = 40.0, Color? color}) {
    return SpinKitFadingCircle(
      color: color ?? _defaultColor,
      size: size,
    );
  }

  /// Three bouncing dots animation
  /// Ideal for infinite scroll loading (e.g., when loading more data on scroll)
  static Widget threeBounce({double size = 20.0, Color? color}) {
    return SpinKitThreeBounce(
      color: color ?? _blackColor,
      size: size,
    );
  }

  /// Circular rotating ring
  /// Best used for fullscreen loading or longer processes
  static Widget ring({double size = 50.0, Color? color}) {
    return SpinKitRing(
      color: color ?? _defaultColor,
      size: size,
      lineWidth: 4.0,
    );
  }

  /// Pulse effect (growing/shrinking circle)
  /// Suitable for lightweight loading indicators, e.g., inside a button
  static Widget pulse({double size = 40.0, Color? color}) {
    return SpinKitPulse(
      color: color ?? _defaultColor,
      size: size,
    );
  }

  /// Loader with gradient effect
  /// Optional: visually attractive for fullscreen or centered loaders
  static Widget gradientCircle({double size = 50.0}) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [_defaultColor, _secondaryColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: const SpinKitCircle(
        color: Colors.white, // This base color is overridden by the gradient
        size: 50.0,
      ),
    );
  }
}
