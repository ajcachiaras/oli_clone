import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final String name;
  void Function(int)? onTap;

  AddButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Icon(Icons.add),
          Text('Test')
        ],
      ),
    );
  }
}
