import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  Task({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            CustomSlidableAction(
              onPressed: deleteTask,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
              child: Icon(
                Icons.delete,
                size: 30,
                color: Colors.yellow.shade200,
              ),
            ),
          ],
        ),
        child: Container(
          //style container
          padding: const EdgeInsets.all(25),

          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2),
          ),

          //isi container
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskStatus,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              //taskName
              Text(
                taskName,
                style: TextStyle(
                  decoration:
                      taskStatus
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
