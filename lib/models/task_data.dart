import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier{
  List <Task> _tasks = [];
  //Making the list private so that in add task screen we dont use .tasks.add
  //and instead use .addtask which is the method defined below

  UnmodifiableListView <Task> get tasks {
    return UnmodifiableListView(_tasks);
  } 

  int get taskCount {
    return _tasks.length;
  }
  
  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners(); //Most important!
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}