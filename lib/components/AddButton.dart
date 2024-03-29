import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final String title;
  void Function()? onPressed;
  // final Widget page;
  AddButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onPressed,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}