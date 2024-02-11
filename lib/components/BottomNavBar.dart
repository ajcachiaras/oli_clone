import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        padding: EdgeInsets.symmetric(horizontal: 125, vertical: 10),
        activeColor: Colors.cyan,
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(icon: Icons.lightbulb),
          // GButton(icon: Icons.add_circle,
          // iconColor: Colors.cyan,
          // iconSize: 75,),
          GButton(icon: Icons.person_pin)
        ],
      ),
    );
  }
}
