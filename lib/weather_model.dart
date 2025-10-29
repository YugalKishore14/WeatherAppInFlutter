class Weather {
  final String cityName;
  final String country;
  final String description;
  final String iconCode;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.country,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.mainCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      country: json['sys']['country'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      temperature: (json['main']['temp']).toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed']).toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
