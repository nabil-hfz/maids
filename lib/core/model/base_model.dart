// Project imports:
import 'package:maids/core/entity/base_entity.dart';

abstract class BaseModel<T extends BaseEntity> {
  const BaseModel();

  T toEntity();

  /// FNV-1a 64bit hash algorithm optimized for Dart Strings
  int fastHash(int id) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    var strId = id.toString();
    while (i < strId.length) {
      final codeUnit = strId.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }
    return hash;
  }
}

String? toUtc(DateTime? date) => date?.toUtc().toIso8601String();

DateTime? fromUtc(String? dateString) =>
    DateTime.tryParse(dateString ?? '')?.toLocal();
