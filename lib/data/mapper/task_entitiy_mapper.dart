import '../../model/model.dart';
import '../data.dart';

class TaskEntityMapper {
  TaskEntityMapper._();

  static TaskEntity fromModel(Task task) {
    return TaskEntity(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      dueDate: task.dueDate,
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
    );
  }

  static Task toModel(TaskEntity taskEntity) {
    return Task(
      id: taskEntity.id,
      title: taskEntity.title,
      description: taskEntity.description,
      isCompleted: taskEntity.isCompleted,
      dueDate: taskEntity.dueDate,
      createdAt: taskEntity.createdAt,
      updatedAt: taskEntity.updatedAt,
    );
  }
}
