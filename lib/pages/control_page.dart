import 'package:flutter/material.dart';
import 'package:to_do_app/pages/doDay_page.dart';
import 'package:to_do_app/pages/events_page.dart';
import 'package:to_do_app/pages/maintain_page.dart';
import 'package:to_do_app/pages/timer_page.dart';
import 'package:to_do_app/utils/dialog_box_undertacker.dart';
import 'package:to_do_app/utils/my_app_bar.dart';
import 'package:to_do_app/utils/my_buttom_bar.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  _ControlPageState createState() => _ControlPageState();
}

// membuat app bar default dan hanya body yang dynamic
class _ControlPageState extends State<ControlPage> {
  int _selectedIndex = 0; // Menyimpan index halaman aktif

  final List<Widget> _pages = [
    DoDayPage(),
    EventsPage(),
    TimerPage(),
    MaintainPage(),
  ];

  String setTitle(String index) {
    if (index == "0") {
      return "DO DAY";
    } else if (index == "1") {
      return "EVENTS";
    } else if (index == "2") {
      return "TIMER";
    } else {
      return "MAINTENANCE";
    }
  }

  //Alert for not empty page
  void _showMaintainPageAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBoxUndertacker(backPage: _backPage);
      },
    );
  }

  void _backPage() {
    setState(() {
      _selectedIndex = 0; // Change to DoDayPage
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: setTitle(_selectedIndex.toString())),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: MyButtomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 2 || index == 3 || index == 1) {
              _showMaintainPageAlert();
            }
          });
        },
      ),
    );
  }
}
