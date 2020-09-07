import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      //The consumer widget is used so that we don't have to repeat writing 
      //Provide.of blah blah blah!
      //This consumer widget is the one going to listen for changes in taskData.
          builder: (context, taskData, child) {
            return ListView.builder(itemBuilder: (context, index){
              final task = taskData.tasks[index];
        return TaskTile(
          taskTitle: task.name,
          isChecked: task.isDone,
          checkboxCallback: (bool checkboxState){
            taskData.updateTask(task);
          },
          longPressCallback: (){
            taskData.deleteTask(task);
          },
        );
      },
      itemCount: taskData.taskCount,
      );
      }
    );
  }
}
