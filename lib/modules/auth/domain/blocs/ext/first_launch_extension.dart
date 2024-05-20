part of '../auth_cubit.dart';

extension FirstLaunchExtension on AuthCubit {
  Future<void> _didChangeFirstLaunchApp([bool value = false]) async {
    emit(state.copyWith(isLoggedIn: const BaseLoadingState()));

    /// get current version
    final firstLaunch = await _repository.didChangeFirstLaunchApp(value);

    Logger.debug('firstLaunch is  $firstLaunch');

    /// emit current state success state
    emit(
      state.copyWith(
        isLoggedIn: const BaseSuccessState(),
      ),
    );
  }
}
