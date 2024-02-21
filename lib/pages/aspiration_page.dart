import 'package:flutter/material.dart';
import 'package:noli/models/goals_model.dart';
import 'package:provider/provider.dart';

class AspirationPage extends StatelessWidget {
  final int aspiration;

  const AspirationPage({super.key, required this.aspiration});

  void _makeGoal(){
    // TODO: add controller data to provider list
  }


  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController();

    List iconLabels = [
      'Goals',
      'Family',
      'Education',
      'Work',
      'Friends',
      'Health',
      'Relationship',
      'Finances',
      'Wellness',
      'Community',
      'empty',
      'empty',
      'Hobby',
      'empty',
      'empty',
      'Other',
      'empty',
      'empty'
    ];

    List iconNames = [
      'goals.png',
      'family.png',
      'education.png',
      'work.png',
      'friends.png',
      'health.png',
      'relationship.png',
      'finances.png',
      'wellness.png',
      'community.png',
      'empty',
      'empty',
      'hobbies.png',
      'empty',
      'empty',
      'other.png',
      'empty',
      'empty',
    ];
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
    )
    ),
    body: Center(
      child: Column(
        children: [
          const Text(
            'Create aspiration in the category of: ',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30
            ),
          ),
          Container(
            // decoration: _isSelectedList[index]
            //     ? BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     border: Border.all(
            //       color: Colors.cyan,
            //       width: 5,
            //     ))
            //     : BoxDecoration(
            //     borderRadius: BorderRadius.circular(20)),
            // color: Colors.transparent,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/${iconNames[aspiration]}',
                  height: 150,
                  width: 150,
                ),
                Text(iconLabels[aspiration],
                    style: const TextStyle(
                      fontSize: 25,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextField(
                      controller: controller,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Chat with Oli'
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<GoalsModel>(
                    builder: (context, value, child) => GestureDetector(
                      onTap: () {
                        final goals = context.read<GoalsModel>();
                        goals.addGoal(Goal(iconLabels[aspiration], controller.text));
                        Navigator.of(context)..pop()..pop();

                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        // color: Colors.cyan,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.cyan
                        ),
                        child: Icon(Icons.send),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
