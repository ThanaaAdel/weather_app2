import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/pages/home_page.dart';
import 'package:weather_app2/provider/weather_provider.dart';

void main() {
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return  WeatherProvider();
      },
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}