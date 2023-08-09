import 'package:flutter/material.dart';
import 'package:taskmanager/ext/date_extension.dart';
import 'package:taskmanager/model/model.dart';

import '../../common/app_colors.dart';

typedef OnTaskPressed = void Function(Task task);
typedef OnTaskStatusChanged = void Function(Task task, bool isCompleted);

class TaskItemView extends StatelessWidget {
  const TaskItemView({Key? key, required this.task, this.onChanged, this.onTap}) : super(key: key);

  final Task task;
  final OnTaskStatusChanged? onChanged;
  final OnTaskPressed? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(task),
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (value) => onChanged?.call(task, value!),
            ),
            title: Text(
              task.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(task.description),
            // trailing: task.isCompleted ? const Icon(Icons.check_circle, color: Colors.green) : null,
            trailing: Text(
              '${task.dueDate?.toDueDate()}',
              style: const TextStyle(color: kcTaskDueColor),
            )),
      ),
    );
  }
}
