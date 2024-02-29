// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTask _$UserTaskFromJson(Map<String, dynamic> json) => UserTask(
      myTasks: (json['myTasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      familyTasks: (json['familyTasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserTaskToJson(UserTask instance) => <String, dynamic>{
      'myTasks': instance.myTasks,
      'familyTasks': instance.familyTasks,
    };
