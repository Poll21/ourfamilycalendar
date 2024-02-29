// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      hideTask: json['hideTask'] as bool,
      fulfilled: json['fulfilled'] as bool,
      time: DateTime.parse(json['time'] as String),
      title: json['title'] as String,
      toDo: json['toDo'] as String,
      authorId: json['authorId'] as String,
      category: json['category'] as String,
      priority: json['priority'] as bool,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'title': instance.title,
      'toDo': instance.toDo,
      'authorId': instance.authorId,
      'category': instance.category,
      'priority': instance.priority,
      'fulfilled': instance.fulfilled,
      'hideTask': instance.hideTask,
    };
