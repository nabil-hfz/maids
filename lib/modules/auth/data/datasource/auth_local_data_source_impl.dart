import 'package:injectable/injectable.dart';

abstract class IAuthLocalDataSource {
  const IAuthLocalDataSource();
}

@Singleton(as: IAuthLocalDataSource)
class ImplAuthLocalDataSource implements IAuthLocalDataSource {
  const ImplAuthLocalDataSource();
}
