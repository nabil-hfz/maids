// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoFilterModel _$TodoFilterModelFromJson(Map json) => TodoFilterModel(
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      skip: (json['skip'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TodoFilterModelToJson(TodoFilterModel instance) =>
    <String, dynamic>{
      'skip': transformPageNumberToSkipCriteria(instance.skip),
      'limit': instance.limit,
    };
