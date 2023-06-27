import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/daily_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/network/api.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({
    super.key,
    required this.dailyForecastData,
  });

  final DailyForecastData dailyForecastData;

  @override
  Widget build(BuildContext context) {
    final dailyForecastList = dailyForecastData.daily;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Theme.of(context).colorScheme.tertiaryContainer),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '7-day Forecast',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: 12,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                );
              },
              itemCount: dailyForecastList!.length,
              itemBuilder: (ctx, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Text(dailyForecastList[index].forecastDay)),
                  Expanded(
                    child: Image(
                      height: 40,
                      image: NetworkImage(
                        WeatherService().weatherIcon(
                            dailyForecastList[index].weather?[0].icon ?? ''),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                          '${dailyForecastList[index].temp?.minTempInCelsius}'
                              '\u00b0C')),
                  Expanded(
                      child: Text(
                          '${dailyForecastList[index].temp?.maxTempInCelsius}'
                              '\u00b0C')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
