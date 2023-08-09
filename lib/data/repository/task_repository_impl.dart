import 'package:rxdart/rxdart.dart';
import 'package:taskmanager/data/data.dart';
import 'package:taskmanager/model/task.dart';

import '../../app/app.locator.dart';
import '../../domain/domain.dart';

class TaskRepositoryImpl extends TaskRepository {
  final _dataSource = locator<DataSource>();

  final BehaviorSubject<List<Task>> _tasksSubject = BehaviorSubject<List<Task>>.seeded([]);

  TaskRepositoryImpl() {
    _updateTaskListStream();
  }

  @override
  Stream<List<Task>> get tasksStream => _tasksSubject.stream;

  @override
  Future<void> addTask(Task task) async {
    _dataSource.putTask(TaskEntityMapper.fromModel(task));
    _updateTaskListStream();
  }

  @override
  Future<void> deleteTask(Task task) async {
    _dataSource.deleteTask(task.id);
    _updateTaskListStream();
  }

  @override
  Future<List<Task>> getAllTasks() {
    return _dataSource.getAllTasks().then((value) => value.map((e) => TaskEntityMapper.toModel(e)).toList());
  }

  @override
  Future<void> updateTask(Task task) async {
    _dataSource.putTask(TaskEntityMapper.fromModel(task));
    _updateTaskListStream();
  }

  @override
  Future<List<Task>> getCompletedTasks() {
    return getAllTasks().then((list) => list.where((element) => element.isCompleted).toList());
  }

  @override
  Future<List<Task>> getTodoTasks() {
    return getAllTasks().then((list) => list.where((element) => !element.isCompleted).toList());
  }

  @override
  Future<Task?> getTask(int id) async {
    final entity = await _dataSource.getTask(id);
    if (entity == null) return null;
    return TaskEntityMapper.toModel(entity);
  }

  Future<void> _updateTaskListStream() async {
    _tasksSubject.value = await getAllTasks();
  }
}
