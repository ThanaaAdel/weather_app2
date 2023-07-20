import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app2/weather_model/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'c2185023630c4f72812142732232606';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri uri = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=4&aqi=no&alerts=no');
    http.Response response = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromjson(data);
    return weatherModel;
  }
}
