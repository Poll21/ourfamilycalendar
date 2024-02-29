import 'package:json_annotation/json_annotation.dart';
import 'package:our_family_calendar/domain/user_task/task.dart';

part 'user_task.g.dart';

@JsonSerializable()
class UserTask {
  final List<Task> myTasks;
  final List<Task> familyTasks;

  UserTask({
    required this.myTasks,
    required this.familyTasks,
  });
}
