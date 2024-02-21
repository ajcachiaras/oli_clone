import 'package:flutter/material.dart';

class UserInfoBox extends StatelessWidget {
  final String title;
  // void Function()? onPressed;
  // final Widget page;
  UserInfoBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        width: 125,
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: Colors.cyan,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
