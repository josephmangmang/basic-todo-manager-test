import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskmanager/ui/common/app_colors.dart';
import 'package:taskmanager/ui/common/ui_helpers.dart';

import '../task_list/task_list_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 89,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xFF2C43DD),
              child: const Row(
                children: [
                  Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 42,
                  ),
                  horizontalSpaceSmall,
                  Text('Task Manager',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Expanded(child: TaskListView()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: viewModel.openAddTaskView, child: const Icon(Icons.add)),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
