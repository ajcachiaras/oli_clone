import 'package:flutter/material.dart';

class NoliPage extends StatelessWidget {
  const NoliPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column (
        children: [
          Container(
              width: 200,
              height: 200,
              child: Image.asset('images/noli.png')),
          const Text(style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), 'Howdy, Andrew!'),
          // ^probably change this font

        ],
      ),
    );
  }
}
