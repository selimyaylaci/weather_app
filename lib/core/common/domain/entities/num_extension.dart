import '../../../_core_exports.dart';

extension NumExtension on num {
  /// Height
  double get height {
    return AppScale.getHeight(this);
  }

  /// Width
  double get width {
    return AppScale.getWidth(this);
  }
}