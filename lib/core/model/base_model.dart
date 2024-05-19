// Project imports:
import 'package:equatable/equatable.dart';
import 'package:maids/core/entity/base_entity.dart';

abstract class BaseModel<T extends BaseEntity> extends Equatable {
  const BaseModel();

  T toEntity();
}

String? toUtc(DateTime? date) => date?.toUtc().toIso8601String();

DateTime? fromUtc(String? dateString) =>
    DateTime.tryParse(dateString ?? '')?.toLocal();
