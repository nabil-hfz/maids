import 'package:maids/core/entity/base_entity.dart';
import 'package:maids/core/model/base_model.dart';
import 'package:maids/core/model/result.dart';

abstract class BaseRepository {
  const BaseRepository();

  static Result<Entity>
      execute<Model extends BaseModel, Entity extends BaseEntity>({
    required Result<Model> remoteResult,
  }) {
    if (remoteResult.hasDataOnly) {
      return Result(
        data: remoteResult.data!.toEntity() as Entity,
      );
    } else {
      return Result(error: remoteResult.error);
    }
  }

  static Result<List<Entity>> executeForList<Model extends BaseModel<Entity>,
      Entity extends BaseEntity>({required Result<List<Model>> remoteResult}) {
    if (remoteResult.hasDataOnly) {
      return Result(
        data: remoteResult.data!.map((model) => model.toEntity()).toList(),
      );
    } else {
      return Result(error: remoteResult.error);
    }
  }

  static Result<Object> executeForNoData({
    required Result<Object> remoteResult,
  }) {
    if (remoteResult.hasDataOnly) {
      return const Result(data: Object());
    }
    return Result(error: remoteResult.error);
  }
}
