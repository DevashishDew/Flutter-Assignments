import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/current_weather_data.dart';
class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({
    super.key,
    required this.currentWeatherData,
  });

  final CurrentWeatherData? currentWeatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          currentWeatherData?.name ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Today',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          '${currentWeatherData?.main?.tempInCelsius}'
          '\u00b0C',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          '${currentWeatherData?.weather?[0].main}',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          '${currentWeatherData?.main?.minTempInCelsius}\u00b0C/${currentWeatherData?.main?.maxTempInCelsius}\u00b0C',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
