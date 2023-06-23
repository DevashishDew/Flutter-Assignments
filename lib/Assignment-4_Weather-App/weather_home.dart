import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/models/current_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/models/daily_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/models/hourly_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/network/api.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/wheather_theme.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/widgets/hourly_forecast_widget.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/widgets/daily_forecast_widget.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/widgets/main_drawer.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/widgets/progress_indicator.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final weatherService = WeatherService();
  CurrentWeatherData? currentWeatherData;

  @override
  void initState() {
    super.initState();
    weatherService.getCurrentWeather().then((value) {
      currentWeatherData = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: MainDrawer(
            onSelectScreen: (value) {},
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () =>
                              _scaffoldKey.currentState?.openDrawer(),
                        ),
                        const Text(
                          'Weather app',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                        const Icon(
                          Icons.add_circle,
                        ),
                      ],
                    ),
                    FutureBuilder<CurrentWeatherData>(
                        future: weatherService.getCurrentWeather(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            final CurrentWeatherData? currentWeatherData =
                                snapshot.data;
                            return (currentWeatherData != null)
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      Text(
                                        currentWeatherData.name ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 42),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text(
                                        'Today',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 24),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        '${currentWeatherData.main?.tempInCelsius}'
                                        '\u00b0C',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 72,
                                        ),
                                      ),
                                      const Text(
                                          '----------------------------------------'
                                          '----'),
                                      Text(
                                        '${currentWeatherData.weather?[0].main}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 24),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        '${currentWeatherData.main?.minTempInCelsius}\u00b0C/${currentWeatherData.main?.maxTempInCelsius}\u00b0C',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 24),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                : const Center(
                                    child: Text('Error occured!'),
                                  );
                          } else {
                            return const ProgressIndicatorWidget();
                          }
                        }),
                    FutureBuilder<HourlyForecastData>(
                        future: weatherService.getHourlyForecastData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            final HourlyForecastData? hourlyForecastData =
                                snapshot.data;
                            return (hourlyForecastData != null)
                                ? HourlyForecast(
                                    hourlyForecastData: hourlyForecastData,
                                  )
                                : const Center(
                                    child: Text('Couldn\'t fetch hourly data!'),
                                  );
                          } else {
                            return const ProgressIndicatorWidget();
                          }
                        }),
                    const SizedBox(
                      height: 24,
                    ),
                    FutureBuilder<DailyForecastData>(
                      future: weatherService.getDailyForecastData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final DailyForecastData? dailyForecastData =
                              snapshot.data;
                          return (dailyForecastData != null)
                              ? DailyForecast(
                                  dailyForecastData: dailyForecastData,
                                )
                              : const Center(
                                  child: Text('Couldn\'t fetch daily data!'),
                                );
                        } else {
                          return const ProgressIndicatorWidget();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
