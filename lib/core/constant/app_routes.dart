import '../../feature/_feature_exports.dart';
import '../_core_exports.dart';

class AppRoutes {
  static const String login = "/login";
  static const String home = "/home";

  // Main
  List<GetPage<dynamic>> get appRoutes => [
        GetPage(name: AppRoutes.login, page: () => LoginPage()),
        GetPage(name: AppRoutes.home, page: () => const HomePage()),
      ];
}
