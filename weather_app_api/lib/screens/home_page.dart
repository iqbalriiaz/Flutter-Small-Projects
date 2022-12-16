import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? position;
  var latitude;
  var longitude;


  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position!.latitude;
      longitude = position!.longitude;
    });
    fetchWeatherData();
  }


  Map<String, dynamic>? weatherMap;
  Map<String, dynamic>? forecastMap;

  fetchWeatherData() async {
    String weatherAPILink =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=b63c1983caa888b1c19c2e545bac6502";
    String forecastAPILink =
        "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=b63c1983caa888b1c19c2e545bac6502";

    var weatherResponse = await http.get(Uri.parse(weatherAPILink));
    var forecastResponse = await http.get(Uri.parse(forecastAPILink));

    weatherMap = Map<String, dynamic>.from(jsonDecode(weatherResponse.body));
    forecastMap = Map<String, dynamic>.from(jsonDecode(forecastResponse.body));

    setState(() {
      print("Weather response is ${weatherMap!["base"]}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: weatherMap != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          color: Colors.blueGrey,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                    flex: 3,
                                                    child: Text(
                                                        "${Jiffy(DateTime.now()).format("MMM do yy, h:mm a")}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Flexible(
                                                  flex: 2,
                                                  child: Text(
                                                      "${weatherMap!["name"]}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            // color: Colors.blueGrey,
                                            // shape: BoxShape.circle,
                                            ),
                                        child: Card(
                                          elevation: 20,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(200)),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Flexible(
                                                  flex: 3,
                                                  child: Image.network(
                                                      // "http://openweathermap.org/img/wn/10d@2x.png"),
                                                      "http://openweathermap.org/img/wn/${weatherMap!["weather"][0]["icon"]}@2x.png"),
                                                ),
                                                Flexible(
                                                  flex: 2,
                                                  child: Text(
                                                      "${weatherMap!["main"]["temp"]} °C",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                          fontSize: 35,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                    "${weatherMap!["weather"][0]["main"]}",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: double.infinity,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            color: Colors.grey,
                                            elevation: 20,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40.0, right: 40.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Feels like",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "${weatherMap!["main"]["feels_like"]} °",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: double.infinity,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            color: Colors.grey,
                                            elevation: 20,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40.0, right: 40.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Humidity",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "${weatherMap!["main"]["humidity"]}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: double.infinity,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            color: Colors.grey,
                                            elevation: 20,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40.0, right: 40.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Pressure",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "${weatherMap!["main"]["pressure"]}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: double.infinity,
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: forecastMap!.length,
                                      itemBuilder: (context, index) {
                                        return Center(
                                          child: Container(
                                            width: 200,
                                            decoration: BoxDecoration(
                                                color: Colors.blueGrey,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            margin: EdgeInsets.only(right: 10),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                      "${Jiffy(forecastMap!["list"][index]["dt_txt"]).format("EEE h:mm a")}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Image.network(
                                                      // "http://openweathermap.org/img/wn/10d@2x.png"),
                                                      "http://openweathermap.org/img/wn/${forecastMap!["list"][index]["weather"][0]["icon"]}@2x.png"),
                                                  Text(
                                                      "${(forecastMap!["list"][index]["main"]["temp_min"])}/${(forecastMap!["list"][index]["main"]["temp_max"])}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "${(forecastMap!["list"][index]["weather"][0]["description"])}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Center(child: CircularProgressIndicator())
                // Image.asset("assets/images/giphy.gif",fit: BoxFit.fitHeight,)

                )));
  }
}
