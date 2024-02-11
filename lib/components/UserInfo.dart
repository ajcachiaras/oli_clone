import 'package:flutter/material.dart';

// NEED TO MAKE THIS WIDGET HAVE PARAMETERS

class UserInfoBox extends StatelessWidget {
  final String title;
  const UserInfoBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.black,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('DataData'),
            Text(title),
          ],
        ),
      ),
    );
  }
}
