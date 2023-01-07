import 'package:flutter/material.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/model/weather_model.dart';
import 'package:untitled2/readings.dart';
import 'package:untitled2/services/weather_api_client.dart';
// import 'package:untitled2/views/additional_information.dart';
import 'package:untitled2/views/current_weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();

}
class _GraphPageState extends State<GraphPage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Muar");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf9f9f9),
    appBar: AppBar(
    backgroundColor: Color(0xFF87ceeb),
    elevation: 0.0,
    title: const Text(
    "Weather Forecast",
    style: TextStyle(color: Colors.white),),
    centerTitle: true,
    )
    );
  }
}
