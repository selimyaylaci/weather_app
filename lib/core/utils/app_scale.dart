import '../_core_exports.dart';

class AppScale {
  static final AppScale instance = AppScale._init();
  factory AppScale() => instance;
  AppScale._init();

  // Screen Size
  static final Size screenSize =
      MediaQuery.of(GlobalContextKey.instance.globalKey.currentContext!).size;

  // General
  static final double width = screenSize.width;
  static final double height = screenSize.height;
  static const double constantWidth = 428;
  static const double constantHeight = 926;

  static double getHeight(final num scale) =>
      screenSize.height * (scale / constantHeight);
  static double getWidth(final num scale) =>
      screenSize.width * (scale / constantWidth);

  // Assets
  static final double buttonHeight = 56.height;
}
