import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      content: SizedBox(
        height: 150,
        width: 300,
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Input Text
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 2,
                  ),
                ),
                hintText: "ADD NEW TASK",
              ),
            ),
            //Button => tambah and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "save", onPressed: onSave),
                const SizedBox(width: 10),
                MyButton(text: "cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
