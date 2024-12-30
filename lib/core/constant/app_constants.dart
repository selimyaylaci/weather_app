class AppConstants {
  /// weather icon
  static String getIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode@2x.png';
  }

  /// api key
  static const String apiKey = "6b09941e949e452a951086c3f9383602";

  /// url
  static const String url = 'https://api.openweathermap.org/data/2.5/weather';
}
