import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app2/pages/search_page.dart';
import 'package:weather_app2/provider/weather_provider.dart';
import 'package:weather_app2/weather_model/weather_model.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi(){
    setState(() {

    });
  }
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
actions: [IconButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder:(context) {
    return SearchPage(
      updateUi: updateUi,
    );
    },
  ));
}, icon: Icon(Icons.search))],
        title: Text('Weather App'),
      ),
      body: weatherData == null ?
      Center(
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ):
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Text(Provider.of<WeatherProvider>(context).cityName!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          Text('${weatherData!.date.toString()}',style: TextStyle(fontSize: 18),),
        ],),
          Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Image.asset('assets/images/clear.png'),
          Text(weatherData!.temp.toInt().toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
            Text('minTemp :${weatherData!.minTemp.toInt()}'),

          ],)

        ],),
          Spacer(),
          Text(weatherData!.weatherStateName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
          Spacer(flex: 3,),

      ],),
    );
  }
}
