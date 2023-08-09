import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskmanager/ext/date_extension.dart';
import 'package:taskmanager/model/model.dart';
import 'package:taskmanager/ui/common/app_colors.dart';
import 'package:taskmanager/ui/common/ui_helpers.dart';

import 'task_detail_viewmodel.dart';

class TaskDetailView extends StackedView<TaskDetailViewModel> {
  const TaskDetailView(this.task, {Key? key}) : super(key: key);
  final Task task;

  @override
  Widget builder(
    BuildContext context,
    TaskDetailViewModel viewModel,
    Widget? child,
  ) {
    final task = viewModel.task;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      backgroundColor: kcTaskContainerColor,
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: AlignmentDirectional.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceMedium,
            Text(task.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            verticalSpaceMedium,
            const Text('Description', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            verticalSpaceSmall,
            Card(
                child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.description,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        verticalSpaceMedium,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.task_alt),
                                horizontalSpaceTiny,
                                Text(task.isCompleted ? 'COMPLETED' : 'TODO',
                                    style: TextStyle(
                                        color: task.isCompleted ? Colors.green : kcTaskDueColor,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.create),
                                    horizontalSpaceTiny,
                                    Text(task.createdAt.toDueDate())
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time_outlined),
                                    horizontalSpaceTiny,
                                    Text(task.dueDate.toDueDate(), style: const TextStyle(color: kcTaskDueColor))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        verticalSpaceSmall,
                      ],
                    ))),
            verticalSpaceMedium,
            Container(
              alignment: AlignmentDirectional.center,
              child: FilledButton.tonalIcon(
                onPressed: viewModel.deleteTask,
                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)),
                icon: const Icon(Icons.delete),
                label: const Text('Delete Task'),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.editTask(task),
        child: const Icon(Icons.edit),
      ),
    );
  }

  @override
  TaskDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TaskDetailViewModel(task);

  @override
  void onViewModelReady(TaskDetailViewModel viewModel) {
    viewModel.init();
  }
}
