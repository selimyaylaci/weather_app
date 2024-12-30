class WeatherModel {
  final String? cityName;
  final String? icon;
  final String? description;
  final String? degree;
  final String? min;
  final String? max;
  final String? humidity;

  WeatherModel({
    this.cityName,
    this.icon,
    this.description,
    this.degree,
    this.min,
    this.max,
    this.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json["name"],
      icon: json["weather"]?[0]["icon"],
      description: json["weather"]?[0]["description"],
      degree: json["main"]?["temp"].toString(),
      min: json["main"]?["temp_min"].toString(),
      max: json["main"]?["temp_max"].toString(),
      humidity: json["main"]?["humidity"].toString(),
    );
  }
}
