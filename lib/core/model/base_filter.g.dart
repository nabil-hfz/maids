// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseFilter _$BaseFilterFromJson(Map json) => BaseFilter(
      skip: (json['skip'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$BaseFilterToJson(BaseFilter instance) =>
    <String, dynamic>{
      'skip': transformPageNumberToSkipCriteria(instance.skip),
      'limit': instance.limit,
    };
