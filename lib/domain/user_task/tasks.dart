import 'package:our_family_calendar/domain/user_task/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tasks.g.dart';

@JsonSerializable()
class Tasks {
  final List<Task> tasks;

  Tasks({required this.tasks});
}