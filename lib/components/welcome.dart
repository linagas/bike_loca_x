import 'package:bike_loca_x/components/login_page.dart';
import 'package:flutter/material.dart';
// Own
import './home.dart';
import './map-provider.dart';
import './database.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Welcome to BikeLocation APP"),
                SizedBox(width: 25),
                SizedBox(
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 25),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text('Data'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Database()),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: RaisedButton(
                        child: Text('Maps'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapProvider()),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text('Sign in'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: RaisedButton(
                        child: Text('Sign up'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
