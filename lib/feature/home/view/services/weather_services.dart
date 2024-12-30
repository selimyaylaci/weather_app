import '../../../../core/_core_exports.dart';
import '../../../_feature_exports.dart';

class WeatherServices {
  final Dio _dio = Dio();

  Future<WeatherModel> getWeatherData(String city) async {
    try {
      final response = await _dio.get(
        AppConstants.url,
        queryParameters: {
          'q': city,
          'appid': AppConstants.apiKey,
          'units': 'metric',
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception(
            "Failed to fetch weather data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching weather data: $e");
    }
  }
}
