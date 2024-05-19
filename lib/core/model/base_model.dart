// Project imports:
import 'package:maids/core/entity/base_entity.dart';

abstract class BaseModel<T extends BaseEntity> {
  const BaseModel();

  T toEntity();
}

String? toUtc(DateTime? date) => date?.toUtc().toIso8601String();

DateTime? fromUtc(String? dateString) =>
    DateTime.tryParse(dateString ?? '')?.toLocal();
