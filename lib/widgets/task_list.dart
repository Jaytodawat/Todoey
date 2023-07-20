import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Taskdata>(  
      builder: (BuildContext context, taskdata, Widget? child) {
        return ListView.builder(
          itemCount: taskdata.taskList.length,
          itemBuilder: (context, index) {
            final taskList = taskdata.taskList;
            return GestureDetector(
              onLongPress: () {
                taskdata.deleteTask(index);
              },
              child: TaskTile(
                isChecked: taskList[index].isDone,
                taskTile: taskList[index].name,
                checkBoxCallback: (checkboxState) {
                  taskdata.updateTask(taskList[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
