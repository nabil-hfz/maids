import 'package:json_annotation/json_annotation.dart';
import 'package:maids/core/model/base_filter.dart';

part 'todo_filter_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true, includeIfNull: false)
class TodoFilterModel extends BaseFilter {
  const TodoFilterModel({
    super.limit,
    super.skip,
  });

  factory TodoFilterModel.fromJson(Map<String, dynamic> json) =>
      _$TodoFilterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TodoFilterModelToJson(this);

  @override
  String toString() {
    return "$TodoFilterModel(${toJson()}";
  }

  TodoFilterModel copyWith({int? skip}) {
    return TodoFilterModel(skip: skip ?? this.skip);
  }
}
