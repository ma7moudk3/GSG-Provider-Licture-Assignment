import 'package:flutter/material.dart';
import 'package:todo_statemanagment/database_helper/DataBaseHelper.dart';
import 'package:todo_statemanagment/model/Task.dart';

class MyProvider extends ChangeNotifier {
  String testName;
  List<Task> allTasks;
  void changeName(String name) {
    testName = name;
    notifyListeners();
  }

  insertTask(tasks) {
    this.allTasks = tasks;
    notifyListeners();
  }

  getAllTasks() {
    DBHelper.dbHelper.getAllTasks();
    notifyListeners();
  }

  updateTask(Task task) {
    DBHelper.dbHelper.updateTask(task);
    getAllTasks();
  }

  deleteTask(Task task) {
    DBHelper.dbHelper.deleteTask(task.id);
    getAllTasks();
  }
}
