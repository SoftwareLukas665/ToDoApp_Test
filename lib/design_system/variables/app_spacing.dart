import 'package:flutter/material.dart';
import 'dart:ui';

class AppSpacing {
  double screenWidth = PlatformDispatcher.instance.views.first.physicalSize.width /
      PlatformDispatcher.instance.views.first.devicePixelRatio;

  double screenHeight = PlatformDispatcher.instance.views.first.physicalSize.height /
      PlatformDispatcher.instance.views.first.devicePixelRatio;

  double outerSpacingRight = 0.0;
  double outerSpacingLeft = 0.0;
}