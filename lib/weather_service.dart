import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  final String? apiKey = dotenv.env['OPENWEATHER_API_KEY'];

  Future<Weather> fetchWeatherData(String cityName) async {
    if (apiKey == null || apiKey!.isEmpty) {
      throw Exception(
        'OpenWeather API key is missing. Please set it in the .env file.',
      );
    }

    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('City not found. Please check the city name.');
    } else if (response.statusCode == 401) {
      throw Exception(
          'Invalid API Key. Please check your .env file or wait for key activation.');
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }

  String getWeatherIconUrl(String iconCode) {
    return 'http://openweathermap.org/img/wn/$iconCode@2x.png';
  }
}
