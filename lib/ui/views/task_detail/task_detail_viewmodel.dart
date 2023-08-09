import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskmanager/app/app.router.dart';
import 'package:taskmanager/domain/domain.dart';
import 'package:taskmanager/model/task.dart';

import '../../../app/app.locator.dart';

class TaskDetailViewModel extends BaseViewModel {
  TaskDetailViewModel(this.task);

  final _navigationService = locator<NavigationService>();
  final taskRepository = locator<TaskRepository>();
  final dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();

  Task task;

  init() async {
    loadTask();
  }

  // Navigate to AddTaskView and pass the task to edit
  void editTask(Task task) async {
    await _navigationService.navigateToAddTaskView(task: task);
    loadTask();
  }

  Future<void> loadTask() async {
    setBusy(true);
    final updatedTask = await taskRepository.getTask(task.id);
    if (updatedTask != null) {
      task = updatedTask;
    } else {
      _navigationService.back();
    }
    setBusy(false);
  }

  void deleteTask() {
    dialogService
        .showConfirmationDialog(title: 'Delete', description: 'Are you sure you want to delete ${task.title}?')
        .then((action) async {
      if (action != null && action.confirmed) {
        await taskRepository.deleteTask(task);
        _navigationService.back();
        _snackbarService.showSnackbar(
          message: 'Task successfully deleted',
          mainButtonTitle: 'UNDO',
          onMainButtonTapped: () async {
            _snackbarService.closeSnackbar();
            await taskRepository.addTask(task);
          },
        );
      }
    });
  }
}
