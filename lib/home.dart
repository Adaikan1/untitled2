import 'package:flutter/material.dart';
import 'package:untitled2/model/weather_model.dart';
import 'package:untitled2/readings.dart';
import 'package:untitled2/services/weather_api_client.dart';
//import 'package:untitled2/views/additional_information.dart';
import 'package:untitled2/views/current_weather.dart';

import 'auth_service.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();

}
class _FirstPageState extends State<FirstPage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Muar");
  }

  @override
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
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xFF87CEEB), Color(0xFFFFFFFF)]
            )
        ),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  currentWeather(Icons.wb_sunny_rounded, "${data!.temp}  ̊",
                      "${data!.cityName}"),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text("Additional Information",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xdd212121),
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  Divider(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children: <Widget> [
                      Row(
                        children: [
                          SizedBox(width: 50),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.orange,
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder:(context)=>Fruit_list())
                                // );
                              },
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(height: 7),
                                  Image.asset("wind.png",
                                    height: 60,width: 120,
                                  ),
                                  const SizedBox(height: 7),
                                  Text('${data!.wind} m/s'),
                                  Text(style:
                                  TextStyle(fontWeight: FontWeight.bold),
                                      'Wind'),
                                  const SizedBox(height: 7),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.orange,
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder:(context)=>Fruit_list())
                                // );
                              },
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(height: 7),
                                  Image.asset("pressure.png",
                                    height: 60,width: 120,
                                  ),
                                  const SizedBox(height: 7),
                                  Text('${data!.pressure} Pa'),
                                  Text(style:
                                  TextStyle(fontWeight: FontWeight.bold),
                                      'Pressure'),
                                  const SizedBox(height: 7),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 50),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.orange,
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder:(context)=>Fruit_list())
                                // );
                              },
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(height: 7),
                                  Image.asset("humidity.png",
                                    height: 60,width: 120,
                                  ),
                                  const SizedBox(height: 7),
                                  Text('${data!.humidity}%'),
                                  Text(style:
                                  TextStyle(fontWeight: FontWeight.bold),
                                      'Humidity'),
                                  const SizedBox(height: 7),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.orange,
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder:(context)=>Fruit_list())
                                // );
                              },
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(height: 7),
                                  Image.asset("feelslike.png",
                                    height: 60,width: 120,
                                  ),
                                  const SizedBox(height: 7),
                                  Text('${data!.feels_like}  ̊'),
                                  Text(style:
                                  TextStyle(fontWeight: FontWeight.bold),
                                      'Feels Like'),
                                  const SizedBox(height: 7),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 125),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            child: InkWell(
                              splashColor: Colors.orange,
                              onTap: () {
                                AuthService().signOut();
                              },
                              child: Column(
                                children: <Widget>[
                                  SizedBox(width: 120),
                                  const SizedBox(height: 7),
                                  Text('Back'),
                                  const SizedBox(height: 7),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                  // additionalInformation("${data!.wind}", "${data!.pressure}",
                  //     "${data!.humidity}", "${data!.feels_like}"),

                ],
              );
            }
            else if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),

      /*bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Crop',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Graph',
            backgroundColor: Colors.purple,
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),*/

    );
  }
}
