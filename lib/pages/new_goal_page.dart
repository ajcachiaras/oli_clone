import 'package:flutter/material.dart';
import 'package:noli/components/ReasonIcon.dart';
import 'package:noli/pages/aspiration_page.dart';

class NewGoalPage extends StatefulWidget {
  const NewGoalPage({super.key});

  @override
  State<NewGoalPage> createState() => _NewGoalPageState();
}

class _NewGoalPageState extends State<NewGoalPage> {
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

  List<int> emptyList = [10, 11, 13, 14, 16, 17];
  List<bool> _isSelectedList = List.generate(18, (index) => false);


  void _createAspiration(int aspiration) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
            AspirationPage(aspiration: aspiration)));
  }

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
          )
      ),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset('images/noli.png', scale: 10),
              PhysicalModel(
                color: Colors.white,
                elevation: 20,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  width: 275,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1
                    )
                  ),
                  child: Text('Start by selecting an aspiration category below:',
                  textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
          Container(
            height: 400,
            width: 400,
            child: GridView.count(
              padding: const EdgeInsets.all(8),
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(18, (index) {
                if (emptyList.contains(index)) {
                  return const BlankReasonIcon();
                } else {
                  return GestureDetector(
                      onTap: () {
                        _createAspiration(index);
                      },
                      child: PhysicalModel(
                        color: Colors
                            .white, //_isSelectedList[index] ? Colors.white : Colors.cyanAccent,
                        elevation: 5,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: _isSelectedList[index]
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.cyan,
                                    width: 5,
                                  ))
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                          // color: Colors.transparent,
                          height: 100,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/${iconNames[index]}',
                                height: 75,
                                width: 75,
                              ),
                              Text(iconLabels[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ),
                      ));
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
