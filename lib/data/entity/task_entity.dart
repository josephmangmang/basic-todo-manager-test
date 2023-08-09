import 'package:objectbox/objectbox.dart';

@Entity()
class TaskEntity {
  @Id()
  int id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime? updatedAt;
  final DateTime createdAt;
  final DateTime? dueDate;

  TaskEntity(
      {required this.id,
      required this.title,
      required this.description,
      this.isCompleted = false,
      this.updatedAt,
      required this.createdAt,
      this.dueDate});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          isCompleted == other.isCompleted &&
          updatedAt == other.updatedAt &&
          createdAt == other.createdAt &&
          dueDate == other.dueDate;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isCompleted.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      dueDate.hashCode;
}
