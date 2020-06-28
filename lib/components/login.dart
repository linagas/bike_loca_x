// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert' show json;

import 'package:bike_loca_x/services/authServices.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './map-provider.dart';
import './database.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to BikeLocation APP',
      home: SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  State createState() => SignInState();
}

class SignInState extends State<SignIn> {
  var _authServices = new AuthServices();
  GoogleSignInAccount _currentUser;
  String _contactText;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        print(account);
        _currentUser = account;
      });
      if (_currentUser != null) {
        print(_currentUser);
      }
    });
    //_googleSignIn.signInSilently();
  }
  
  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          const Text("Signed in successfully."),
          Text(_contactText ?? ''),
        ],
      );
    } else {
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
                      _signInButton(),
                      SizedBox(width: 25),
                      Expanded(
                        child: RaisedButton(
                          child: Text('Sign up'),
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
                          child: Text('Data'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Database()),
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        getSignIn().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              // ignore: missing_return
              builder: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_currentUser) => MapProvider()),
                );
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getSignIn() async {
    await _authServices.handleSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to BikeLocation APP'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
