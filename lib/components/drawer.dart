import 'package:bike_loca_x/components/login.dart';
import 'package:bike_loca_x/services/authServices.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  var _authServices = new AuthServices();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the Drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: 
            Text('Bike Lovers - Menu'),
            decoration: BoxDecoration(
              color: Colors.grey[400],
            ),
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => LoginPage()),
              // );
            },
          ),
          /* ListTile(
            title: Text('Perfil'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FirebaseDb()),
              // );
            },
          ),
          ListTile(
            title: Text('Configuración'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ), */
          ListTile(
            title: Text('Cerrar Sesión'),
            onTap: () {
              // Update the state of the app
              getSignOut();
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              );
            },
          ),
        ],
      ),
    );
  }

  getSignOut() async {
    await _authServices
        .handleSignOut(); //use a .then() in the end if the function oyuncuSec returns something and you want to do something with the result...
  }
}
