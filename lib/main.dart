import 'package:flutter/material.dart';
import 'package:todo_statemanagment/provider/my_provider.dart';
import 'package:todo_statemanagment/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return MyProvider();
    },
    child: MaterialApp(
      home: SplashScreen(),
    ),
  ));
}

class TestScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                 Provider.of<MyProvider>(context,listen: true).testName,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<MyProvider>(context, listen: false)
                        .changeName('Hassan');
                  },
                  child: Text('Change Value'))
            ],
          ),
        ),
      ),
    );
  }
}
