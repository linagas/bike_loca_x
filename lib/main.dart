import 'package:flutter/material.dart';
// Own
import 'components/welcome.dart';
import 'service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(MaterialApp(
    title: 'BikeSites',
    home: WelcomePage(),
  ));
}
