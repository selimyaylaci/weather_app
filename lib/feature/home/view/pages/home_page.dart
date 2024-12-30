import '../../../../core/_core_exports.dart';
import '../../../_feature_exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget get _loadingIndicator {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorWidget(Object? error) {
    return Center(
      child: Text(
        "Error: $error",
        style: AppTextStyles.body1Regular.copyWith(color: AppColors.supportRed),
      ),
    );
  }

  Widget get _noDataWidget {
    return const Center(
      child: Text(AppTranslator.errorWeather),
    );
  }

  Widget _weatherDetails(WeatherModel weatherData) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherData.cityName ?? "Unknown City",
            style: AppTextStyles.headline1Semibold,
          ),
          SizedBox(height: AppScale.getHeight(16)),
          Image.network(
            AppConstants.getIconUrl(weatherData.icon ?? ''),
          ),
          SizedBox(height: AppScale.getHeight(16)),
          Text(
            "${weatherData.degree}°C",
            style: AppTextStyles.headline2Medium,
          ),
          SizedBox(height: AppScale.getHeight(12)),
          Text(
            weatherData.description ?? "No description",
            style: AppTextStyles.body1Regular.copyWith(color: AppColors.sub),
          ),
          SizedBox(height: AppScale.getHeight(12)),
          Text(
            "Min: ${weatherData.min}°C, Max: ${weatherData.max}°C",
            style: AppTextStyles.body1Regular,
          ),
          SizedBox(height: AppScale.getHeight(12)),
          Text(
            "Humidity: ${weatherData.humidity}%",
            style: AppTextStyles.body1Regular,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cityName = Get.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTranslator.homePageTitle,
          style: AppTextStyles.headline2Medium,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<WeatherModel>(
        future: WeatherServices().getWeatherData(cityName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _loadingIndicator;
          } else if (snapshot.hasError) {
            return _errorWidget(snapshot.error);
          } else if (!snapshot.hasData) {
            return _noDataWidget;
          }
          return _weatherDetails(snapshot.data!);
        },
      ),
    );
  }
}
