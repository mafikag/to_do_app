import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyButtomBar extends StatelessWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const MyButtomBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[200],
      child: Container(
        height: 110,
        decoration: BoxDecoration(color: Colors.yellow),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          gap: 8,
          padding: EdgeInsets.all(15),
          color: Colors.yellow[900],
          tabBackgroundColor: Colors.yellow.shade900,
          activeColor: Colors.yellow[200],
          tabs: [
            GButton(icon: Icons.assignment, text: 'Do Day'),
            GButton(icon: Icons.assignment_late_rounded, text: 'Events'),
            GButton(icon: Icons.access_time_filled_rounded, text: 'Timer'),
            GButton(icon: Icons.do_not_disturb_on, text: ''),
          ],
          selectedIndex: selectedIndex,
          onTabChange: onItemTapped,
        ),
      ),
    );
  }
}
