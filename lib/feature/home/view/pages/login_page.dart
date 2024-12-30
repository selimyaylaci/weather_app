import '../../../../core/_core_exports.dart';
import '../../../_feature_exports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget get _title {
    return Center(
      child: Text(
        AppTranslator.loginPageTitle,
        style: AppTextStyles.headline2Semibold,
      ),
    );
  }

  Widget get _cityName {
    return Center(
      child: AppTextField(
        controller: serviceLocator<LoginController>().cityController,
        hintText: AppTranslator.textFieldTitle,
      ),
    );
  }

  Widget get _continueButton {
    return Center(
      child: AppTextButton(
        text: AppTranslator.continueButton,
        onTapped: () {
          if (serviceLocator<LoginController>()
              .cityController
              .text
              .isNotEmpty) {
            Get.toNamed('/home',
                arguments:
                    serviceLocator<LoginController>().cityController.text);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            AppScale.getWidth(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title,
              SizedBox(
                height: AppScale.getHeight(64),
              ),
              _cityName,
              const Spacer(),
              _continueButton,
            ],
          ),
        ),
      ),
    );
  }
}
