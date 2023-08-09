// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;
import 'package:taskmanager/model/model.dart' as _i8;
import 'package:taskmanager/ui/views/add_task/add_task_view.dart' as _i5;
import 'package:taskmanager/ui/views/home/home_view.dart' as _i2;
import 'package:taskmanager/ui/views/startup/startup_view.dart' as _i3;
import 'package:taskmanager/ui/views/task_detail/task_detail_view.dart' as _i6;
import 'package:taskmanager/ui/views/task_list/task_list_view.dart' as _i4;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const taskListView = '/task-list-view';

  static const addTaskView = '/add-task-view';

  static const taskDetailView = '/task-detail-view';

  static const all = <String>{
    homeView,
    startupView,
    taskListView,
    addTaskView,
    taskDetailView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.taskListView,
      page: _i4.TaskListView,
    ),
    _i1.RouteDef(
      Routes.addTaskView,
      page: _i5.AddTaskView,
    ),
    _i1.RouteDef(
      Routes.taskDetailView,
      page: _i6.TaskDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.TaskListView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.TaskListView(),
        settings: data,
      );
    },
    _i5.AddTaskView: (data) {
      final args = data.getArgs<AddTaskViewArguments>(
        orElse: () => const AddTaskViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.AddTaskView(key: args.key, task: args.task),
        settings: data,
      );
    },
    _i6.TaskDetailView: (data) {
      final args = data.getArgs<TaskDetailViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.TaskDetailView(args.task, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddTaskViewArguments {
  const AddTaskViewArguments({
    this.key,
    this.task,
  });

  final _i7.Key? key;

  final _i8.Task? task;

  @override
  String toString() {
    return '{"key": "$key", "task": "$task"}';
  }

  @override
  bool operator ==(covariant AddTaskViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.task == task;
  }

  @override
  int get hashCode {
    return key.hashCode ^ task.hashCode;
  }
}

class TaskDetailViewArguments {
  const TaskDetailViewArguments({
    required this.task,
    this.key,
  });

  final _i8.Task task;

  final _i7.Key? key;

  @override
  String toString() {
    return '{"task": "$task", "key": "$key"}';
  }

  @override
  bool operator ==(covariant TaskDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.task == task && other.key == key;
  }

  @override
  int get hashCode {
    return task.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTaskListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.taskListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddTaskView({
    _i7.Key? key,
    _i8.Task? task,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addTaskView,
        arguments: AddTaskViewArguments(key: key, task: task),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTaskDetailView({
    required _i8.Task task,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.taskDetailView,
        arguments: TaskDetailViewArguments(task: task, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTaskListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.taskListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddTaskView({
    _i7.Key? key,
    _i8.Task? task,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addTaskView,
        arguments: AddTaskViewArguments(key: key, task: task),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTaskDetailView({
    required _i8.Task task,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.taskDetailView,
        arguments: TaskDetailViewArguments(task: task, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
