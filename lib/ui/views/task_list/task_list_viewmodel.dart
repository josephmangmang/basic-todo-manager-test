import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskmanager/app/app.router.dart';
import 'package:taskmanager/domain/domain.dart';

import '../../../app/app.locator.dart';
import '../../../model/model.dart';

class TaskListViewModel extends BaseViewModel {
  final taskRepository = locator<TaskRepository>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  List<Task> todoTasks = [];
  List<Task> completedTasks = [];

  final busyKeyTodoList = 'todo_list';
  final busyKeyCompletedTask = 'completed_tasks';

  void init() {
    loadTasks();
  }

  void loadTasks() {
    taskRepository.tasksStream.listen((allTasks) {
      todoTasks = allTasks.where((element) => !element.isCompleted).toList();
      completedTasks = allTasks.where((element) => element.isCompleted).toList();
      rebuildUi();
    });
  }

  void openTaskDetails(Task task) async {
    await _navigationService.navigateToTaskDetailView(task: task);
  }

  Future<void> setTaskCompleted(Task task, bool value, {bool showSnackBar = true}) async {
    await taskRepository.updateTask(task.copyWith(isCompleted: value));
    if (showSnackBar) {
      _snackbarService.showSnackbar(
          message: 'Task mark as ${value ? 'completed' : 'uncompleted'}',
          mainButtonTitle: 'UNDO',
          onMainButtonTapped: () {
            _snackbarService.closeSnackbar();
            setTaskCompleted(task, !value, showSnackBar: false);
          });
    }
  }
}
