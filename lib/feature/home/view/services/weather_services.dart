import '../../../../core/_core_exports.dart';
import '../../../_feature_exports.dart';

class WeatherServices {
  final Dio _dio = Dio();

  Future<String> _getLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw Exception("Location permissions are denied.");
      }
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final city = placemarks[0].locality;

    if (city == null || city.isEmpty) {
      throw Exception("Could not determine your city.");
    }
    return city;
  }

  Future<WeatherModel> getWeatherData() async {
    final city = await _getLocation();

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
