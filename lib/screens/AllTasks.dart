import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_statemanagment/database_helper/DataBaseHelper.dart';
import 'package:todo_statemanagment/model/Task.dart';
import 'package:todo_statemanagment/provider/my_provider.dart';
import 'HomePage.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var db = DBHelper();
    DBHelper.dbHelper..getAllTasks().then((value) {
      Provider.of<MyProvider>(context, listen: false).insertTask(value);
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<MyProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.allTasks.length,
              itemBuilder: (_, int position) {
                bool isComplete = false;
                if (value.allTasks[position].isComplete) {
                  isComplete = true;
                } else {
                  isComplete = false;
                }
                return Container(
                  height: 70,
                  child: Center(
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          Widget cancelButton = TextButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                          Widget continueButton = TextButton(
                            child: Text("Yes"),
                            onPressed: () {
                              DBHelper.dbHelper..deleteTask(value.allTasks[position].id);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false);
                            },
                          );

                          AlertDialog alert = AlertDialog(
                            title: Text("Delete Task?"),
                            content: Text("Are you want to delete this Task?"),
                            actions: [
                              cancelButton,
                              continueButton,
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text(value.allTasks[position].taskName),
                      trailing: Checkbox(
                          value: isComplete,
                          onChanged: (value1) {
                            DBHelper.dbHelper.updateTask(Task(
                              id: value.allTasks[position].id,
                              taskName: value.allTasks[position].taskName,
                              isComplete: value1,
                            ));
                            DBHelper.dbHelper.getAllTasks().then((value) {
                              Provider.of<MyProvider>(context, listen: false)
                                  .insertTask(value);
                            });
                          }),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
