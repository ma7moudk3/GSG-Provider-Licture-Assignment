import 'package:flutter/material.dart';
import 'package:todo_statemanagment/database_helper/DataBaseHelper.dart';
import 'package:todo_statemanagment/model/Task.dart';
import 'package:todo_statemanagment/screens/HomePage.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({
    Key key,
    @required this.db,
  }) : super(key: key);

  final DBHelper db;

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    var controller = TextEditingController();
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add New Task',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Task Name',
                  fillColor: Colors.grey,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                ),
                autofocus: true,
                cursorColor: Colors.lightBlueAccent,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTaskTitle = controller.text;
                },
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: SizedBox(
                  width: 250.0,
                  child: ElevatedButton(
                      onPressed: () {
                        db.insertTask(
                            Task(taskName: newTaskTitle, isComplete: false));
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                   ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
