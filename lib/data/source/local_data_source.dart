import 'package:objectbox/objectbox.dart';
import 'package:taskmanager/data/entity/task_entity.dart';
import 'package:taskmanager/data/source/data_source.dart';

import '../../app/app.locator.dart';

class LocalDataSource extends DataSource {
  final store = locator<Store>();

  LocalDataSource();

  @override
  void putTask(TaskEntity task) {
    store.box<TaskEntity>().put(task);
  }

  @override
  void deleteTask(int taskId) {
    store.box<TaskEntity>().remove(taskId);
  }

  @override
  Future<List<TaskEntity>> getAllTasks() {
    return store.box<TaskEntity>().getAllAsync();
  }

  @override
  Future<TaskEntity?> getTask(int id) async {
    return store.box<TaskEntity>().get(id);
  }
}
