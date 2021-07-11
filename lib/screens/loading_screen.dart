import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print(position);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(position);
    return Scaffold();
  }
}
