import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget{
  //Parent of task tile is tasks_list
  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback, this.longPressCallback});

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(taskTitle, style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(
      value: isChecked, 
      activeColor: Colors.lightBlueAccent,
      onChanged: checkboxCallback,
      ),
    );
  }
}
