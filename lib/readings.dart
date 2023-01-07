import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/model/weather_model.dart';
import 'package:untitled2/services/weather_api_client.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  State<ReadingPage> createState() => _ReadingPageState();

}
class _ReadingPageState extends State<ReadingPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('ESP32_Device');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('ESP32_Device');

  Widget listItem({required Map ESPDevice_32}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ESPDevice_32['pH'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            ESPDevice_32['Moisture'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            ESPDevice_32['Temperature'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            ESPDevice_32['Conductivity'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            ESPDevice_32['Conductivity'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            ESPDevice_32['Nitrogen'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            ESPDevice_32['Phosphorus'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            ESPDevice_32['Pottasium'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (_) => ReadingPage(ESP_Device32Key: ESPDevice_32['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetching data'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

              Map ESPDevice_32 = snapshot.value as Map;
              ESPDevice_32['key'] = snapshot.key;

              return listItem(ESPDevice_32: ESPDevice_32);

            },
          ),
        )
    );
  }
  /*WeatherApiClient client = WeatherApiClient();
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
            "Crop Status",
            style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Color(0xFFFFFFFF), Color(0xFF86CDE9)]
              )
          ),
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Column(
                        children: <Widget> [
                          Row(
                            children: [
                              SizedBox(width: 65),
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
                                      new CircularPercentIndicator(
                                        radius: 55.0,
                                        lineWidth: 13.0,
                                        animation: true,
                                        percent: 0.7,
                                        center: new Text(
                                          "70.0%",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                        ),
                                        footer: new Text(
                                          "pH",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Colors.redAccent,
                                      ),
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
                                      new CircularPercentIndicator(
                                        radius: 55.0,
                                        lineWidth: 13.0,
                                        animation: true,
                                        percent: 0.7,
                                        center: new Text(
                                          "70.0%",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                        ),
                                        footer: new Text(
                                          "Moisture (RH)",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Colors.orangeAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 65),
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
                                      new CircularPercentIndicator(
                                        radius: 55.0,
                                        lineWidth: 13.0,
                                        animation: true,
                                        percent: 0.7,
                                        center: new Text(
                                          "70.0  ̊C",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                        ),
                                        footer: new Text(
                                          "Temperature",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Colors.yellowAccent,
                                      ),
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
                                      new CircularPercentIndicator(
                                        radius: 55.0,
                                        lineWidth: 13.0,
                                        animation: true,
                                        percent: 0.7,
                                        center: new Text(
                                          "70.0",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                        ),
                                        footer: new Text(
                                          "EC (us/cm)",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Colors.greenAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height:10),
                          Row(
                            children: [
                              SizedBox(width: 65),
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
                                      new CircularPercentIndicator(
                                        radius: 55.0,
                                        lineWidth: 13.0,
                                        animation: true,
                                        percent: 0.7,
                                        center: new Text(
                                          "70.0",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                        ),
                                        footer: new Text(
                                          "Nitrogen",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Colors.blue,
                                      ),
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
                                      new CircularPercentIndicator(
                                        radius: 55.0,
                                        lineWidth: 13.0,
                                        animation: true,
                                        percent: 0.7,
                                        center: new Text(
                                          "70.0",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                        ),
                                        footer: new Text(
                                          "Phophorus",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Colors.deepPurple,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 140),
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
                                      new CircularPercentIndicator(
                                        radius: 55.0,
                                        lineWidth: 13.0,
                                        animation: true,
                                        percent: 0.7,
                                        center: new Text(
                                          "70.0",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                        ),
                                        footer: new Text(
                                          "Pottasium",
                                          style:
                                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Colors.purpleAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(width: 20),
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
            )
        ),
    );
  }*/
}

