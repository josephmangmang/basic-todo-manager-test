import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/model.dart';
import '../../common/ui_helpers.dart';
import 'add_task_viewmodel.dart';

/// The AddTaskView is a form that allows the user to add a new task or edit an existing task.
/// [task] is an optional parameter that is used to determine if the user is adding a new task or editing an existing task.
class AddTaskView extends StackedView<AddTaskViewModel> {
  const AddTaskView({
    Key? key,
    this.task,
  }) : super(key: key);

  final Task? task;

  @override
  Widget builder(
    BuildContext context,
    AddTaskViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Form(
            key: viewModel.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  controller: viewModel.titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    labelText: 'Title',
                  ),
                ),
                TextFormField(
                  controller: viewModel.descriptionController,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.description),
                    labelText: 'Description',
                  ),
                ),
                TextFormField(
                  readOnly: true,
                  controller: viewModel.dueDateController,
                  keyboardType: TextInputType.multiline,
                  onTap: () => viewModel.selectDueDate(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a due date';
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Due date',
                  ),
                ),
                verticalSpaceMedium,
                FilledButton.tonalIcon(
                  onPressed: viewModel.saveTask,

                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                )
              ],
            )),
      ),
    );
  }

  @override
  AddTaskViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddTaskViewModel(task);

  @override
  void onViewModelReady(AddTaskViewModel viewModel) {
    viewModel.init();
  }
}
