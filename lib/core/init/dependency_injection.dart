import 'package:get_it/get_it.dart';
import '../../feature/_feature_exports.dart';
import '../_core_exports.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  /*  // Instance
  serviceLocator.registerFactory<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: AppConstants.baseApiAddress,
      ),
    ),
    instanceName: AppConstants.dioInstanceName,
  ); */

  // Controllers
  final LoginController loginController = Get.put(LoginController());
  serviceLocator.registerLazySingleton<LoginController>(() => loginController);
}
