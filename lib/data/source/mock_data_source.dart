import 'package:taskmanager/data/data.dart';

class MockDataSource extends DataSource {
  final Map<int, TaskEntity> mockTaskList = Map.fromEntries(List.generate(
    10,
    (index) {
      final id = index + 1;
      return TaskEntity(
        id: id,
        title: 'Task $id',
        description: 'Description for Task $id',
        createdAt: DateTime.now(),
        isCompleted: id % 2 == 0,
        dueDate: DateTime.now().add(Duration(hours: index + 3)),
      );
    },
  ).map((e) => MapEntry(e.id, e)));

  @override
  void deleteTask(int taskId) {
    mockTaskList.remove(taskId);
  }

  @override
  Future<List<TaskEntity>> getAllTasks() async {
    return mockTaskList.values.toList();
  }

  @override
  void putTask(TaskEntity task) {
    mockTaskList[task.id] = task;
  }

  @override
  Future<TaskEntity?> getTask(int id) async {
    return mockTaskList[id];
  }
}
