import 'package:flutter/material.dart';
import 'package:noli/components/BottomNavBar.dart';
import 'package:noli/pages/oli_page.dart';
import 'package:noli/pages/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBarIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedBarIndex = index;
    });
  }

  final List<Widget> _pages = [
    const NoliPage(),
    const UserPage()
  ];

  void toggleButtons() {

  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[300],
        shape: CircleBorder(),
        child: Icon(Icons.add),
        onPressed: (){},),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedBarIndex]
    );
  }
}