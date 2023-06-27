import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/current_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/daily_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/hourly_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/network/api.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/theme.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/widgets/hourly_forecast_widget.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/widgets/daily_forecast_widget.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/widgets/main_drawer.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/widgets/main_weather_widget.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/widgets/progress_indicator.dart';
import 'package:geolocator/geolocator.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final weatherService = WeatherService();
  bool isLightTheme = true;

  @override
  void initState() {
    super.initState();
    // locationPermission();
  }

  Future<Position?> locationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return null;
      } else if (permission == LocationPermission.deniedForever) {
        print("'Location permissions are permanently denied");
        return null;
      } else {
        print("GPS Location service is granted");
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        print(position.longitude);
        print(position.latitude);
        return position;
      }
    } else {
      print("GPS Location permission granted.");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position.longitude);
      print(position.latitude);
      return position;
    }
  }

  void _setTheme(){
    setState(() {
      isLightTheme = !isLightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: MainDrawer(
            onSelectTheme: (value) => _setTheme(),
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
                        IconButton(
                          icon: Icon(Icons.add_circle),
                          onPressed: _setTheme,
                        ),
                      ],
                    ),
                    FutureBuilder<Position?>(
                      future: locationPermission(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final lat = snapshot.data?.latitude ?? 0;
                          final lon = snapshot.data?.longitude ?? 0;
                          return Column(
                            children: [
                              FutureBuilder<CurrentWeatherData>(
                                  future: weatherService.getCurrentWeather(
                                      lat, lon),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      final CurrentWeatherData?
                                          currentWeatherData = snapshot.data;
                                      return (currentWeatherData != null)
                                          ? MainWeatherWidget(
                                              currentWeatherData:
                                                  currentWeatherData)
                                          : const Center(
                                              child: Text('Error occured!'),
                                            );
                                    } else {
                                      return const ProgressIndicatorWidget();
                                    }
                                  }),
                              FutureBuilder<HourlyForecastData>(
                                  future: weatherService.getHourlyForecastData(
                                      lat, lon),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      final HourlyForecastData?
                                          hourlyForecastData = snapshot.data;
                                      return (hourlyForecastData != null)
                                          ? HourlyForecast(
                                              hourlyForecastData:
                                                  hourlyForecastData,
                                            )
                                          : const Center(
                                              child: Text(
                                                  'Couldn\'t fetch hourly data!'),
                                            );
                                    } else {
                                      return const ProgressIndicatorWidget();
                                    }
                                  }),
                              const SizedBox(
                                height: 24,
                              ),
                              FutureBuilder<DailyForecastData>(
                                future: weatherService.getDailyForecastData(
                                    lat, lon),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    final DailyForecastData? dailyForecastData =
                                        snapshot.data;
                                    return (dailyForecastData != null)
                                        ? DailyForecast(
                                            dailyForecastData:
                                                dailyForecastData,
                                          )
                                        : const Center(
                                            child: Text(
                                                'Couldn\'t fetch daily data!'),
                                          );
                                  } else {
                                    return const ProgressIndicatorWidget();
                                  }
                                },
                              ),
                            ],
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
