import 'package:flutter/material.dart';

class ReasonIcon extends StatelessWidget {
  final String title;
  final String fileName;

  ReasonIcon({super.key, required this.title, required this.fileName});

  @override
  Widget build(BuildContext context) {
    // TODO: Make this selectable (no clue how to tell what was selected)
    return PhysicalModel(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.transparent,
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(fileName, height: 75, width: 75,),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
              )
            ),
          ],
        ),
      ),
    );
  }
}

class BlankReasonIcon extends StatelessWidget {

  const BlankReasonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 100,
      width: 100,
    );
  }
}
