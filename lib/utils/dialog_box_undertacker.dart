import 'package:flutter/material.dart';

class DialogBoxUndertacker extends StatelessWidget {
  VoidCallback backPage;
  DialogBoxUndertacker({super.key, required this.backPage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: Colors.yellow,
      content: Text(
        'Sorry this page in undertacker',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[TextButton(child: Text('OK'), onPressed: backPage)],
    );
  }
}
