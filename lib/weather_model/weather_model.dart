class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});
  factory WeatherModel.fromjson(dynamic data) {
    var jsonDate = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonDate['avgtemp_c'],
        maxTemp: jsonDate['maxtemp_c'],
        minTemp: jsonDate['mintemp_c'],
        weatherStateName: jsonDate['condition']['text']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'tem = $temp minTemp = $minTemp maxTemp = $maxTemp date = $date';
  }
}
