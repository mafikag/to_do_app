import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyButtomBar extends StatelessWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  MyButtomBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            gap: 8,
            padding: EdgeInsets.all(12),
            color: Colors.yellow[900],
            tabBackgroundColor: Colors.yellow.shade900,
            activeColor: Colors.yellow[200],
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.assignment, text: 'Do Day'),
              GButton(icon: Icons.assignment_late_rounded, text: 'Events'),
            ],
            selectedIndex: selectedIndex,
            onTabChange: onItemTapped,
          ),
        ),
      ),
    );
  }
}
