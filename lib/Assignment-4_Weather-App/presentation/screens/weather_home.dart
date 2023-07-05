import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/core/config/theme%20_preference.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/bloc/current_weather_data_bloc/current_weather_bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/bloc/daily_weather_data_bloc/daily_weather_bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/bloc/geolocation_bloc/geolocation_bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/bloc/hourly_weather_data_bloc/hourly_weather_bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/widgets/daily_forecast_widget.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/widgets/hourly_forecast_widget.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/widgets/main_drawer.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/widgets/main_weather_widget.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/widgets/progress_indicator.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/core/config/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/core/config/di.dart'
    as di;

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  MyThemePreferences myThemePreferences = MyThemePreferences();
  bool isLightTheme = true;

  @override
  void initState() {
    myThemePreferences.init().then((value) => _getTheme());
    super.initState();
  }

  void _getTheme() async {
    isLightTheme = await myThemePreferences.getTheme();
    setState(() {});
    print('Light theme => $isLightTheme');
  }

  void _setTheme() {
    setState(() {
      isLightTheme = !isLightTheme;
      myThemePreferences.setTheme(isLightTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<GeolocationBloc>()..add(LoadGeolocation()),
        ),
        BlocProvider(
          create: (_) => di.locator<CurrentWeatherBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<HourlyWeatherBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DailyWeatherBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
        theme: isLightTheme ? lightTheme : darkTheme,
        darkTheme: darkTheme,
        home: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            drawer: MainDrawer(
              onSelectTheme: (value) => _setTheme(),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
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
                          icon: const Icon(Icons.add_circle),
                          onPressed: _setTheme,
                        ),
                      ],
                    ),
                    BlocConsumer<GeolocationBloc, GeolocationState>(
                      builder: (context, state) {
                        if (state is GeolocationLoaded) {
                          return mainContent();
                        } else if (state is GeolocationPermissionDenied ||
                            state is GeolocationPermissionForever) {
                          return const Text(
                            'Please enable location '
                            'permission to access weather data!',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          );
                        } else if (state is GeolocationLoading) {
                          return const ProgressIndicatorWidget();
                        } else {
                          return const Text('Something went wrong!');
                        }
                      },
                      listener: (context, state) {
                        if (state is GeolocationLoaded) {
                          BlocProvider.of<CurrentWeatherBloc>(context).add(
                              GetCurrentWeatherEvent(state.position.latitude,
                                  state.position.longitude));
                          BlocProvider.of<HourlyWeatherBloc>(context).add(
                              GetHourlyWeatherEvent(state.position.latitude,
                                  state.position.longitude));
                          BlocProvider.of<DailyWeatherBloc>(context).add(
                              GetDailyWeatherDataEvent(state.position.latitude,
                                  state.position.longitude));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column mainContent() {
    return Column(
      children: [
        BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
          builder: (context, state) {
            if (state is CurrentWeatherHasData) {
              return (state.currentWeatherData != null)
                  ? MainWeatherWidget(
                      currentWeatherData: state.currentWeatherData)
                  : const Center(
                      child: Text('No data available!'),
                    );
            }
            if (state is CurrentWeatherError) {
              return Text(state.error);
            } else {
              return const ProgressIndicatorWidget();
            }
          },
        ),
        BlocBuilder<HourlyWeatherBloc, HourlyWeatherState>(
          builder: (context, state) {
            if (state is HourlyWeatherData) {
              return (state.hourlyForecastData != null)
                  ? HourlyForecast(hourlyForecastData: state.hourlyForecastData)
                  : const Center(
                      child: Text('No data available!'),
                    );
            }
            if (state is HourlyWeatherError) {
              return Text(state.error);
            } else {
              return const ProgressIndicatorWidget();
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
        BlocBuilder<DailyWeatherBloc, DailyWeatherState>(
          builder: (context, state) {
            if (state is DailyWeatherData) {
              return (state.dailyForecastData != null)
                  ? DailyForecast(dailyForecastData: state.dailyForecastData)
                  : const Center(
                      child: Text('No data available!'),
                    );
            }
            if (state is DailyWeatherError) {
              return Text(state.error);
            } else {
              return const ProgressIndicatorWidget();
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
