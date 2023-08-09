import '../data.dart';

abstract class DataSource {
  void deleteTask(int taskId);

  void putTask(TaskEntity task);

  Future<List<TaskEntity>> getAllTasks();

  Future<TaskEntity?> getTask(int id);
}
