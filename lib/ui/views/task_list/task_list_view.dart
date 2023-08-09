import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../common_view/with_empty_state.dart';
import 'task_item_view.dart';
import 'task_list_viewmodel.dart';

class TaskListView extends StackedView<TaskListViewModel> {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TaskListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcContainerColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.note_outlined,
                        size: 40,
                      ),
                      horizontalSpaceMedium,
                      Text(
                        'To-do',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  WithEmptyState(
                    isEmpty: viewModel.todoTasks.isEmpty,
                    emptyWidget: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Nothing in To-do',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: viewModel.todoTasks.length,
                        itemBuilder: (context, index) {
                          final task = viewModel.todoTasks[index];
                          return TaskItemView(
                            key: ValueKey(task),
                            task: task,
                            onTap: viewModel.openTaskDetails,
                            onChanged: viewModel.setTaskCompleted,
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.library_add_check_outlined,
                        size: 40,
                      ),
                      horizontalSpaceMedium,
                      Text(
                        'Completed',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  WithEmptyState(
                    isEmpty: viewModel.completedTasks.isEmpty,
                    emptyWidget: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'No completed tasks',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: viewModel.completedTasks.length,
                        itemBuilder: (context, index) {
                          final task = viewModel.completedTasks[index];
                          return TaskItemView(
                            key: ValueKey(task),
                            task: task,
                            onTap: viewModel.openTaskDetails,
                            onChanged: viewModel.setTaskCompleted,
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  TaskListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TaskListViewModel();

  @override
  void onViewModelReady(TaskListViewModel viewModel) {
    viewModel.init();
  }
}
