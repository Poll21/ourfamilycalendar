import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()

class Task {
  final DateTime time;
  final String title;
  final String toDo;
  final String authorId;
  final String category;
  final bool priority;
  final bool fulfilled;
  final bool hideTask;

  Task({
    required this.hideTask,
    required this.fulfilled,
    required this.time,
    required this.title,
    required this.toDo,
    required this.authorId,
    required this.category,
    required this.priority,
  });
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

}