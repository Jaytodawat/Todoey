// ignore_for_file: prefer_final_fields, unused_field

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/task.dart';

class Taskdata extends ChangeNotifier {
  List<Task> _taskList = [];
  final String _dbKey = 'myBox';

  Taskdata() {
    final box = Hive.box<Task>(_dbKey);
    _taskList = box.values.toList();
  }

  //getter
  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  void addTask(String newName) {
    final Task task = Task(name: newName, isDone: false);
    _taskList.add(task);

    final box = Hive.box<Task>(_dbKey);
    box.add(task);

    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    task.save();
    notifyListeners();
  }

  void deleteTask(int index) {
    Task task = _taskList[index];
    _taskList.removeAt(index);
    task.delete();
    notifyListeners();
  }
}
