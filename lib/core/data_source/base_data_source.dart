import 'package:maids/core/errors/errors.dart';
import 'package:maids/core/model/result.dart';
import 'package:maids/core/utils/logger.dart';

Future<Result<T>> transform<T>(Future<T> Function() data) async {
  try {
    var result = await data();
    return Future.value(Result(data: result));
  } catch (error, stack) {
    Logger.error(error, stack);
    if (error is BaseError) return Future.value(Result(error: error));
    return Future.value(const Result(error: UnexpectedError()));
  }
}
