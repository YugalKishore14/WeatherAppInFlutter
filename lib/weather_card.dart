import 'dart:ui';
import 'package:flutter/material.dart';
import 'weather_model.dart';
import 'weather_service.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  final WeatherService _weatherService = WeatherService();

  WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${weather.cityName}, ${weather.country}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    _weatherService.getWeatherIconUrl(weather.iconCode),
                    width: 100,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error_outline,
                        color: Colors.white,
                        size: 50,
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${weather.temperature.round()}°C',
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                weather.description.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withValues(alpha: 0.9),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              Divider(color: Colors.white.withValues(alpha: 0.2)),
              const SizedBox(height: 20),
              _buildDetailRow('Humidity', '${weather.humidity}%'),
              const SizedBox(height: 15),
              _buildDetailRow('Wind Speed', '${weather.windSpeed} m/s'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 18, color: Colors.white.withValues(alpha: 0.7)),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
