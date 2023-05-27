import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum DeviceType { android, ios, fuchsia, web, windows, mac, linux }

enum ScreenType { mobile, tablet, desktop }

class Device {
  static late BoxConstraints boxConstraints;

  static late Orientation orientation;

  static late DeviceType deviceType;

  static late ScreenType screenType;

  static late double blockHorizontal;

  static late double blockVertical;

  static late double height;

  static late double width;

  static late double aspectRatio;

  static late double pixelRatio;

  static void setScreenSize(
    BuildContext context,
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    aspectRatio = constraints.constrainDimensions(width, height).aspectRatio;
    pixelRatio = _ambiguate(WidgetsBinding.instance)!.window.devicePixelRatio;

    blockHorizontal = boxConstraints.maxWidth / 100;
    blockVertical = boxConstraints.maxHeight / 100;

    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          deviceType = DeviceType.android;
          break;
        case TargetPlatform.iOS:
          deviceType = DeviceType.ios;
          break;
        case TargetPlatform.windows:
          deviceType = DeviceType.windows;
          break;
        case TargetPlatform.macOS:
          deviceType = DeviceType.mac;
          break;
        case TargetPlatform.linux:
          deviceType = DeviceType.linux;
          break;
        case TargetPlatform.fuchsia:
          deviceType = DeviceType.fuchsia;
          break;
      }
    }

    if (width >= 1300) {
      screenType = ScreenType.desktop;
    } else if (width < 1300 && width >= 650) {
      screenType = ScreenType.tablet;
    } else {
      screenType = ScreenType.mobile;
    }
  }

  static isLandscape(BuildContext context) {
    return (MediaQuery.of(context).orientation == Orientation.landscape);
  }

  static T? _ambiguate<T>(T? value) => value;
}


typedef ResponsiveBuilderType = Widget Function(
  BuildContext,
  Orientation,
  ScreenType,
);

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final ResponsiveBuilderType builder;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 651;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Device.setScreenSize(
          context,
          constraints,
          orientation,
        );

        if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
          return const SizedBox();
        }
        return builder(context, orientation, Device.screenType);
      });
    });
  }
}
