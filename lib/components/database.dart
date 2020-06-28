import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database extends StatelessWidget {
  // Declare database instance by reference
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Database'),
              backgroundColor: Colors.black,
            ),
            body: Center(
                child: Container(
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RaisedButton(
                                    child: Text('Create Record',
                                        style:
                                            new TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      createRecord();
                                    }),
                                RaisedButton(
                                    child: Text('Update Record',
                                        style:
                                            new TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      updateRecord();
                                    }),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RaisedButton(
                                    child: Text('Get Records',
                                        style:
                                            new TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      getRecords();
                                    }),
                                RaisedButton(
                                    child: Text('Delete Record',
                                        style:
                                            new TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      deleteRecord();
                                    })
                              ]),
                        ])))));
  }

  void createRecord() async {
    DocumentReference ref =
        await databaseReference.collection("locations").add({
      'name': 'From APP',
      'description': 'New record From app desc',
      'lat': 0,
      'lon': 0
    });
    print(ref.documentID);
  }

  void updateRecord() async {
    await databaseReference.collection("locations").document("1").setData({
      'name': 'From APP',
      'description': 'Update record button',
      'lat': 0,
      'lon': 0
    });
  }

  void getRecords() {
    databaseReference
        .collection("locations")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

  void deleteRecord() {
    try {
      databaseReference.collection('locations').document('1').delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
