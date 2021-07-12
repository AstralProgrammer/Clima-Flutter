
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const kApiKey = '5e993c4377d33bc36dc45ceb1ad6ff4e';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // get user coordinates
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    // Get weather data
    NetworkHelper network = NetworkHelper('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&APPID=$kApiKey');

    var json = await network.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
