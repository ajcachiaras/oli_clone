import 'package:flutter/material.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: Colors.cyan,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Center(
        child: Stack(children: [
          Column(
            children: [
              const Text('How do you feel about your progress so far?',
                  textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),),
              const Text('Data pulled from provider'),
              const Spacer(),
                GestureDetector(
                  onTap: () {
                    // TODO: Figure out how to update data to provider on checkin
                    // TODO: Figure out how to toggle button active
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width - 200,
                    child: Center(
                      child: Text(
                        'Complete Check-In'
                      ),
                    ),
                  ),
                ),

                // child: ActionChip( //THIS IS DUMB JUST MAKE A CONTAINER
                //   visualDensity: VisualDensity(
                //     horizontal: 0,
                //     vertical: -4
                //   ),
                //   // labelPadding: EdgeInsets.fromLTRB(0, -6, 0, -6),
                //   padding: EdgeInsets.zero,
                //   disabledColor: Colors.grey,
                //   backgroundColor: Colors.cyan,
                //   label: Text('Complete Check-In')))
            ],
          )
        ]),
      ),
    );
  }
}
