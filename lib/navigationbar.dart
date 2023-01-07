import 'package:flutter/material.dart';
import 'package:untitled2/graph.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/model/weather_model.dart';
import 'package:untitled2/navigationbar.dart';
import 'package:untitled2/readings.dart';
import 'package:untitled2/services/weather_api_client.dart';
// import 'package:untitled2/views/additional_information.dart';
import 'package:untitled2/views/current_weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();

}
class _NavigationPageState extends State<NavigationPage> {  @override

  int index = 0;
  final screens = [
    FirstPage(),
    ReadingPage(),
    GraphPage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
            height: 60,
            backgroundColor: Color(0x86CDE9FF),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),

            destinations: [
              NavigationDestination(
                icon: Icon(Icons.brightness_low_outlined),
                label: 'Weather',
              ),
              NavigationDestination(
                icon: Icon(Icons.blur_on),
                label: 'Crop',
              ),
              NavigationDestination(
                icon: Icon(Icons.analytics_outlined),
                label: 'Graph',
              ),
            ]
        ),
      ),
    );
  }
}
