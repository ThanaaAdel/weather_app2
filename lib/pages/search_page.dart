import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/provider/weather_provider.dart';
import 'package:weather_app2/services/weather_service.dart';
import 'package:weather_app2/weather_model/weather_model.dart';

class SearchPage extends StatelessWidget {

  SearchPage({super.key, this.updateUi});
String? cityName;
VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) async{
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel weatherModel =  await service.getWeather(cityName: cityName!);
             weatherDate = weatherModel;
             Provider.of<WeatherProvider>(context,listen: false).weatherData= weatherModel;
             Provider.of<WeatherProvider>(context,listen: false).cityName =cityName;
              Navigator.pop(context);
              print(weatherModel);
            },
            decoration: const InputDecoration(
                hintText: "enter a city",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                label: Text("search")),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherDate ;