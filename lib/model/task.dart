import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    @Default(0) int id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? dueDate,
  }) = _Task;
}
