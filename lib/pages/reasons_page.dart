import 'package:flutter/material.dart';
import 'package:noli/components/ReasonIcon.dart';

class ReasonsPage extends StatefulWidget {
  const ReasonsPage({super.key});

  @override
  State<ReasonsPage> createState() => _ReasonsPageState();
}

class _ReasonsPageState extends State<ReasonsPage> {
  List iconLabels = [
    'Goals', 'Family', 'Education',
    'Work', 'Friends', 'Health',
    'Relationship', 'Finances', 'Wellness',
    'Community', 'empty', 'empty',
    'Hobby', 'empty', 'empty',
    'Other', 'empty', 'empty'
  ];

  List iconNames = [
    'goals.png', 'family.png', 'education.png',
    'work.png', 'friends.png', 'health.png',
    'relationship.png', 'finances.png', 'wellness.png',
    'community.png', 'empty', 'empty',
    'hobbies.png', 'empty', 'empty',
    'other.png', 'empty', 'empty',
  ];

  List<int> emptyList = [10, 11, 13, 14, 16, 17];
  
  List<Widget> icons = [];

  List<bool> _isSelectedList = List.generate(18, (index) => false);

  @override
  void initState() {
    for (int i = 0; i < iconLabels.length; i++) {
      icons.add(ReasonIcon(
          title: iconLabels[i],
          fileName: 'images/${iconNames[i]}'
      ));
    }
    List<Widget> toInsert = [
      const BlankReasonIcon(),
      const BlankReasonIcon(),
    ];
    // print(icons.length);
    icons.insertAll(10, toInsert);
    icons.insertAll(13, toInsert);
    icons.insertAll(16, toInsert);
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
          )),
      body: Center(
        child: Stack(children: [
          Column(
            children: [
              // TODO: Use provider to get which face to show at the top
              Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('images/mid_gif.gif')
              ),
              const Text('Because of...?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
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
                          setState(() {
                            _isSelectedList[index] = !_isSelectedList[index];
                          });
                        },
                        child: PhysicalModel(
                          color: Colors.white,//_isSelectedList[index] ? Colors.white : Colors.cyanAccent,
                          elevation: 5,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: _isSelectedList[index] ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.cyan,
                                width: 5,
                              )
                            ) : BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            // color: Colors.transparent,
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/${iconNames[index]}', height: 75, width: 75,),
                                Text(
                                    iconLabels[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                    )
                                ),
                              ],
                            ),
                          ),
                        )
                      );
                    }
                  }),
                  // children: List.generate(15, (index) {
                  //   return ReasonIcon(
                  //       title: iconLabels[index],
                  //       fileName: 'images/${iconNames[index]}'
                  //   );
                  // }),
                  // [
                  //   ReasonIcon(
                  //     title: 'Goals',
                  //     fileName: 'images/goals.png',
                  //   ),
                  //   ReasonIcon(
                  //     title: 'Family',
                  //     fileName: 'images/family.png',
                  //   )
                  // ]
                ),
              ),
              Spacer(),
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
