import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_filter.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class BaseFilter extends Equatable {
  @JsonKey(toJson: transformPageNumberToSkipCriteria)
  final int skip;
  final int limit;

  /// Constructs an instance of [BaseFilter] with the given [sort] and
  /// [pagination] parameters.
  const BaseFilter({
    this.skip = 0,
    this.limit = 10,
  });

  factory BaseFilter.fromJson(Map<String, dynamic> json) =>
      _$BaseFilterFromJson(json);

  Map<String, dynamic> toJson() => _$BaseFilterToJson(this);

  @override
  List<Object?> get props => [skip, limit];

  @override
  String toString() {
    return "$BaseFilter(${props.join(', ')})";
  }
}

int transformPageNumberToSkipCriteria(int page) {
  return page * 10;
}
