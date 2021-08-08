import 'package:flutter/material.dart';
import 'package:todo_statemanagment/database_helper/DataBaseHelper.dart';
import 'package:todo_statemanagment/screens/AllTasks.dart';
import 'package:todo_statemanagment/screens/CompleteTasks.dart';
import 'package:todo_statemanagment/screens/InCompleteTasks.dart';
import 'package:todo_statemanagment/widgets/addTaskDialog.dart';

class HomePage extends StatelessWidget {
  var db = DBHelper.dbHelper;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            drawer: Drawer(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddTaskDialog(
                        db: db,
                      );
                    });
              },
              child: Icon(Icons.add),
            ),
            appBar: AppBar(
              title: Text('My Task'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'All Tasks',
                  ),
                  Tab(
                    text: 'complete Tasks',
                  ),
                  Tab(
                    text: 'incomplete  Tasks',
                  )
                ],
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: [AllTasks(), CompleteTasks(), InCompleteTasks()],
            )));
  }
}
