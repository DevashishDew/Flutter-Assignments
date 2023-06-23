import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-2/dashboard.dart';
import 'package:flutter_assignments/Assignment-3/travel_home.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/weather_home.dart';
import 'package:flutter_assignments/Navigation/router.dart';
import 'package:flutter_assignments/features/login/screens/login_screen_form.dart';

import 'Navigation/route_constants.dart';
import 'features/login/screens/login_screen.dart';

void main() {
  runApp(const WeatherHomePage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: homeRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
