import '../../model/model.dart';

abstract class TaskRepository {
  abstract final Stream<List<Task>> tasksStream;

  Future<void> addTask(Task task);

  Future<void> deleteTask(Task task);

  Future<void> updateTask(Task task);

  Future<List<Task>> getAllTasks();

  Future<List<Task>> getTodoTasks();

  Future<List<Task>> getCompletedTasks();

  Future<Task?> getTask(int id);
}
