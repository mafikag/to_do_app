import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utils/dialog_box.dart';
import 'package:to_do_app/utils/task_box.dart';

class DoDayPage extends StatefulWidget {
  const DoDayPage({super.key});

  @override
  State<DoDayPage> createState() => _DoDayPageState();
}

class _DoDayPageState extends State<DoDayPage> {
  //referensi box
  final _myBox = Hive.box("My Box");

  //controller untuk input task
  final _controller = TextEditingController();
  taskDatabase db = taskDatabase();

  @override
  void initState() {
    if (_myBox.get("TASKTODO") == null) {
      db.initialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //fungsi ubah status task if tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.taskToDo[index][1] = !db.taskToDo[index][1];
    });
    db.updateData();
  }

  //fungsi simpan task baru
  void saveNewTask() {
    setState(() {
      db.taskToDo.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateData();
  }

  //fungsi tambah task baru
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }

  //fungsi hapus task
  void deleteTaskFunction(int index) {
    setState(() {
      db.taskToDo.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: createNewTask,
        backgroundColor: Colors.yellow[900],
        child: const Icon(Icons.add, color: Color(0xFFFFF59D)),
      ),

      body: ListView.builder(
        itemCount: db.taskToDo.length,
        itemBuilder: (context, index) {
          return Task(
            taskName: db.taskToDo[index][0],
            taskStatus: db.taskToDo[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTaskFunction(index),
          );
        },
      ),
    );
  }
}
