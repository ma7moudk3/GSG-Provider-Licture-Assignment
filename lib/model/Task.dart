import 'package:todo_statemanagment/database_helper/DataBaseHelper.dart';

class Task {
  int id;
  String taskName;
  bool isComplete;
  Task({this.id, this.taskName, this.isComplete});
  toJson() {
    return {
      DBHelper.columnId: this.id,
      DBHelper.columnName: this.taskName,
      DBHelper.columnIsComplete: this.isComplete ? 1 : 0
    };
  }

  Task.fromJson(Map map) {
    this.taskName = map[DBHelper.columnName];
    this.id = map[DBHelper.columnId];
    this.isComplete = map[DBHelper.columnIsComplete] == 1 ? true : false;
  }
}
