import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskmanager/ext/date_extension.dart';
import 'package:taskmanager/model/model.dart';

import '../../../app/app.locator.dart';
import '../../../domain/domain.dart';

class AddTaskViewModel extends BaseViewModel {
  final taskRepository = locator<TaskRepository>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();
  DateTime? selectedDueDate;

  // to edit task
  final Task? task;

  var formKey = GlobalKey<FormState>();

  bool get isEditing => task != null;

  AddTaskViewModel(this.task);

  void init() {
    if (isEditing) {
      titleController.text = task!.title;
      descriptionController.text = task!.description;
      selectedDueDate = task!.dueDate;
      dueDateController.text = selectedDueDate?.toInputDueDate() ?? '';
    }
  }

  Future<void> selectDueDate(BuildContext context) async {
    final now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDueDate ?? now,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (pickedDate != null) {
      if (context.mounted) {
        final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
        if (time != null) {
          selectedDueDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, time.hour, time.minute);
          dueDateController.text = selectedDueDate.toInputDueDate();
        }
      }
    }
  }

  void saveTask() {
    if (formKey.currentState?.validate() == true) {
      if (isEditing) {
        updateTask();
      } else {
        addTask();
      }
    }
  }

  void updateTask() {
    if (task == null) return;
    taskRepository
        .updateTask(task!.copyWith(
      title: titleController.text,
      description: descriptionController.text,
      updatedAt: DateTime.now(),
      dueDate: selectedDueDate,
    ))
        .then((value) {
      _navigationService.back();
      _snackbarService.showSnackbar(message: 'Task successfully updated');
    });
  }

  void addTask() {
    taskRepository
        .addTask(Task(
      title: titleController.text,
      description: descriptionController.text,
      createdAt: DateTime.now(),
      dueDate: selectedDueDate,
    ))
        .then((value) {
      _navigationService.back();
      _snackbarService.showSnackbar(message: 'Task successfully added');
    });
  }
}
