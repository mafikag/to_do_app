import 'package:flutter/material.dart';
import 'package:to_do_app/pages/doDay_page.dart';
import 'package:to_do_app/pages/events_page.dart';
import 'package:to_do_app/pages/homepage.dart';
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

  final List<Widget> _pages = [HomePage(), DoDayPage(), EventsPage()];

  String setTitle(String index) {
    if (index == "0") {
      return "HOME";
    } else if (index == "1") {
      return "DO DAY";
    } else {
      return "EVENTS";
    }
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
          });
        },
      ),
    );
  }
}
