import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maids/core/bloc/base/base_cubit.dart';
import 'package:maids/core/bloc/base/states/base_fail_state.dart';
import 'package:maids/core/bloc/base/states/base_init_state.dart';
import 'package:maids/core/bloc/base/states/base_loading_state.dart';
import 'package:maids/core/bloc/base/states/base_state.dart';
import 'package:maids/core/bloc/base/states/base_success_state.dart';
import 'package:maids/core/errors/errors.dart';
import 'package:maids/core/utils/logger.dart';
import 'package:maids/modules/auth/data/requests/sign_in_request_model.dart';
import 'package:maids/modules/auth/domain/entity/profile_entity.dart';
import 'package:maids/modules/auth/domain/repo/auth_repository_i.dart';

part 'auth_state.dart';

part 'ext/first_launch_extension.dart';

@Singleton()
class AuthCubit extends BaseCubit<AuthState> {
  late final IAuthRepository _repository;
  ProfileEntity? _profileEntity;

  ProfileEntity? get profileEntity {
    if (state.getProfile is LoggedInAlreadySuccess) {
      return (state.getProfile as LoggedInAlreadySuccess).profile;
    }
    return null;
  }

  AuthCubit(this._repository) : super(AuthState.initialState());

  void checkIfLoggedIn() async {
    // emit(state.copyWith(isLoggedIn: const BaseLoadingState()));
    // final resultFirstLaunch = await _repository.checkFirstLaunch();
    // if (resultFirstLaunch) {
    //   emit(
    //     state.copyWith(
    //       isLoggedIn: const AppFirstLoadSuccess(),
    //     ),
    //   );
    //   return;
    // }

    final results = await _repository.isAlreadyLogged();
    // If th user is already logged in then we will fetch the profile.
    if (results) {
      final results = await _repository.getSavedProfile();
      // Checks if the profile is saved correctly, everything is good.
      if (results != null && results.id != -1) {
        _profileEntity = results;
        emit(
          state.copyWith(
            getProfile: LoggedInAlreadySuccess(profile: _profileEntity!),
          ),
        );
        emit(state.copyWith(isLoggedIn: const BaseSuccessState()));
      }
      // Otherwise ask the user to login again.
      else {
        emit(state.copyWith(isLoggedIn: const ContinueToLoginSuccess()));
      }
    } else {
      emit(state.copyWith(isLoggedIn: const ContinueToLoginSuccess()));
    }
    // We will reset the state after finishing working with this state
    // to prevent any misAction in a listener.
    emit(state.copyWith(isLoggedIn: const BaseInitState()));
  }

  Future<void> login({
    CancelToken? cancelToken,
    required SignInRequestModel request,
    bool rememberMe = true,
  }) async {
    emit(state.copyWith(login: const BaseLoadingState()));
    final results = await _repository.login(
      cancelToken: cancelToken,
      request: request,
      rememberMe: rememberMe,
    );

    if (results.hasDataOnly && results.data != null && results.data != null) {
      _profileEntity = results.data!;
      emit(
        state.copyWith(
          getProfile: LoggedInAlreadySuccess(profile: _profileEntity!),
          login: LoginSuccess(
            results.data?.fullName,
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          login: BaseFailState(
            results.error,
            callback: () {
              login(
                cancelToken: cancelToken,
                request: request,
                rememberMe: rememberMe,
              );
            },
          ),
        ),
      );
    }
    emit(state.copyWith(login: const BaseInitState()));
  }

  void logout() async {
    emit(state.copyWith(logout: const BaseLoadingState()));

    final results = await _repository.logout();
    _profileEntity = null;

    if (results) {
      emit(state.copyWith(logout: const BaseSuccessState()));
    } else {
      emit(
        state.copyWith(
          logout: BaseFailState(
            const UnexpectedError(),
            callback: logout,
          ),
        ),
      );
    }
    emit(AuthState.initialState());
  }

  Future getProfile({CancelToken? cancelToken}) async {
    // Checking if there the profile is cached then we will emit it
    if (_profileEntity == null) {
      emit(state.copyWith(getProfile: const BaseLoadingState()));
    } else {
      emit(
        state.copyWith(
          getProfile: LoggedInAlreadySuccess(
            profile: _profileEntity!,
          ),
        ),
      );
    }
    // Sending a request to get the latest profile info.
    final results = await _repository.getProfile(
      cancelToken: cancelToken,
    );

    if (results.hasDataOnly && results.data != null) {
      if (results.data != null) _profileEntity = results.data!;
      emit(
        state.copyWith(
          getProfile: LoggedInAlreadySuccess(profile: _profileEntity!),
        ),
      );
    } else {
      if (_profileEntity == null) {
        emit(
          state.copyWith(
            getProfile: BaseFailState(
              results.error,
              callback: () {
                getProfile(cancelToken: cancelToken);
              },
            ),
          ),
        );
      }
    }
  }

  Future<void> didChangeFirstLaunchApp([bool value = false]) async {
    return _didChangeFirstLaunchApp(value);
  }
}
