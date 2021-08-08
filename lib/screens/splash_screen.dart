import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_statemanagment/database_helper/DataBaseHelper.dart';
import 'package:todo_statemanagment/provider/my_provider.dart';
import 'package:todo_statemanagment/screens/HomePage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = DBHelper.dbHelper;
    db.getAllTasks().then((value) {
      Provider.of<MyProvider>(context, listen: false).insertTask(value);
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return HomePage();
        }));
      });
    });
    return Scaffold(
      body: Center(
          child: Container(
              height: 100,
              width: 100,
              child: Image.asset('images/applogo.png'))),
    );
  }
}
