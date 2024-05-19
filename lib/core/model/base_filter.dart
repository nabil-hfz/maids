import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_filter.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class BaseFilter extends Equatable {
  int skip;
  int limit;

  /// Constructs an instance of [BaseFilter] with the given [sort] and
  /// [pagination] parameters.
  BaseFilter({
    this.skip = 1,
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
