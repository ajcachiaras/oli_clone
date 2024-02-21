import 'package:flutter/material.dart';
import 'package:noli/components/UserInfo.dart';
import 'package:noli/models/goals_model.dart';
import 'package:noli/pages/new_goal_page.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {

    // final goalModel = context.read<GoalsModel>();
    return Consumer<GoalsModel>(
      builder: (context, goalsModel, child) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [UserInfoBox(title: 'Total Moments',), UserInfoBox(title: 'Streak')],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [UserInfoBox(title: 'Popular Category'), UserInfoBox(title: 'Total Aspirations')],
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    )
                  ),
                  height: 500,
                  child: Expanded(
                    child: goalsModel.goals.isNotEmpty ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: goalsModel.goals.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width-50,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black,
                              )
                          ),
                          child: PhysicalModel(
                            color: Colors.white,
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(goalsModel.goals[index].goalName),
                                SizedBox(
                                  width: 100,
                                ),
                                Text(goalsModel.goals[index].goalDesc)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  ) : Card(
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width-50,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text('No Goals yet'),
                      ),
                    ),
                  ),
                  )
                ),
              ),
              // (),
              GestureDetector(
                onTap: () {
                  // goal creation screen
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewGoalPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 52),
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width - 200,
                  child: Center(
                    child: Text(
                        'Add Goal'
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
