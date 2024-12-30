import 'core/_core_exports.dart';
import 'core/init/dependency_injection.dart' as dependencyInjection;

void main() async {
  /// Widgets
  WidgetsFlutterBinding.ensureInitialized();

  /// Landscape
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  /// Dependency injection
  await dependencyInjection.init();

  await serviceLocator.allReady().then((value) async {
    /// Add duration for native splash
    await Future.delayed(
      const Duration(seconds: 2),
    );

    /// Run app
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      defaultTransition: Transition.native,
      transitionDuration: const Duration(
        milliseconds: 350,
      ),
      navigatorKey: GlobalContextKey.instance.globalKey,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: AppColors.white,
        ),
        primaryColor: AppColors.main,
        scaffoldBackgroundColor: AppColors.white,
        brightness: Brightness.light,
      ),
      getPages: AppRoutes().appRoutes,
      initialRoute: AppRoutes.login,
      locale: Get.deviceLocale,
    );
  }
}
