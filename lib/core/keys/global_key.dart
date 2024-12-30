import '../_core_exports.dart';

class GlobalContextKey {
  // Main
  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  static final GlobalContextKey instance = GlobalContextKey._init();
  GlobalContextKey._init();
}