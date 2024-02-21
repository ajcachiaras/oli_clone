import 'package:flutter/material.dart';

class Goal {
  final String _goalName;
  final String _goalDesc;

  Goal(this._goalName, this._goalDesc);

  String get goalName => _goalName;
  String get goalDesc => _goalDesc;
}

class GoalsModel extends ChangeNotifier {
  List<Goal> goals = [];

  void addGoal(Goal goal) {
    goals.add(goal);
    notifyListeners();
  }

}