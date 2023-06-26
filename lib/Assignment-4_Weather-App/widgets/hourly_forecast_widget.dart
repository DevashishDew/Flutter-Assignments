import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/models/hourly_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/network/api.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({
    super.key,
    required this.hourlyForecastData,
  });

  final HourlyForecastData hourlyForecastData;

  @override
  Widget build(BuildContext context) {
    final hourlyForecastList = hourlyForecastData.hourly;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow:  [
          BoxShadow(color: Theme.of(context).colorScheme.tertiaryContainer),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Forecast for today',
               style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 240,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: hourlyForecastList?.length,
                itemBuilder: (ctx, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Text(
                        '${hourlyForecastList?[index].foreCastTime}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      Image(
                        image: NetworkImage(
                          WeatherService().weatherIcon
                            (hourlyForecastList?[index].weather?[0].icon ?? ''),
                        ),
                      ),
                      Text(
                        '${hourlyForecastList?[index].tempInCelsius}\u00b0C',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Icon(Icons.air),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${hourlyForecastList?[index].windSpeed} km/h',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Icon(
                        CupertinoIcons.umbrella_fill,
                        color: Colors.blue,
                        size: 36.0,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${hourlyForecastList?[index].clouds} %',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
