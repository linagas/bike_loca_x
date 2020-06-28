import 'package:bike_loca_x/components/login.dart';
import 'package:flutter/material.dart';
import 'service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(MaterialApp(
    title: 'BikeSites',
    home: SignIn(),
  ));
}
