import 'package:flutter/material.dart';

class AnimatedBackground extends StatelessWidget {
  final String condition;

  const AnimatedBackground({super.key, required this.condition});

  String _getBackgroundImage(String weatherCondition) {
    final lowerCaseCondition = weatherCondition.toLowerCase();
    if (lowerCaseCondition.contains('clear')) {
      return 'https://images.pexels.com/photos/1110497/pexels-photo-1110497.jpeg'; // Updated URL for clear sky
    } else if (lowerCaseCondition.contains('cloud')) {
      return 'https://images.pexels.com/photos/1110497/pexels-photo-1110497.jpeg';
    } else if (lowerCaseCondition.contains('rain') ||
        lowerCaseCondition.contains('drizzle')) {
      return 'https://images.pexels.com/photos/1110497/pexels-photo-1110497.jpeg'; // Updated URL for rain
    } else if (lowerCaseCondition.contains('thunderstorm')) {
      return 'https://images.pexels.com/photos/1110497/pexels-photo-1110497.jpeg';
    } else if (lowerCaseCondition.contains('snow')) {
      return 'https://images.pexels.com/photos/1110497/pexels-photo-1110497.jpeg';
    } else if (lowerCaseCondition.contains('mist') ||
        lowerCaseCondition.contains('fog') ||
        lowerCaseCondition.contains('haze')) {
      return 'https://images.pexels.com/photos/1110497/pexels-photo-1110497.jpeg';
    }
    return 'https://images.pexels.com/photos/1110497/pexels-photo-1110497.jpeg';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_getBackgroundImage(condition))
              as ImageProvider, // Cast to ImageProvider
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
          // Add an error builder to handle image loading errors gracefully
          onError: (exception, stackTrace) {
            // You can log the error if you want
            // print('Image Error: $exception');
          },
        ),
      ),
      child: Container(),
    );
  }
}
