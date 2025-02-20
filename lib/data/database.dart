import 'package:hive_flutter/hive_flutter.dart';

class taskDatabase {
  // reference a box
  final _myBox = Hive.box("My Box");

  // list of tasks
  List taskToDo = [];

  //initial function where first time open the app
  void initialData() {
    taskToDo = [
      ["Example 1", false],
    ];
  }

  //load data from database
  void loadData() {
    taskToDo = _myBox.get("TASKTODO");
  }

  //update data to database
  void updateData() {
    _myBox.put("TASKTODO", taskToDo);
  }
}
