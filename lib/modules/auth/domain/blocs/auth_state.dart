part of 'auth_cubit.dart';

class AuthState {
  const AuthState({
    required this.register,
    required this.registerResendCode,
    required this.verify,
    //

    required this.isLoggedIn,
    required this.login,
    required this.logout,
    //

    required this.forgetPassword,
    required this.forgetPasswordResendCode,
    required this.confirmForgetPasswordCode,
    //
    required this.changePassword,
    //
    required this.changeEmail,
    required this.changeEmailResendCode,
    required this.confirmChangeEmailCode,
    //
    required this.registerSocialUser,
    required this.getTokenAndProfileSocialLogin,
    required this.getProfile,
    required this.updateProfile,
    //
    required this.loginMethod,
    required this.deleteAccount,
    // required this.verifyFacebookToken,
    // required this.maidsFacebookRegister,
    // required this.verifyIosToken,
    // required this.maidsIosRegister,
  });

  final BaseState register;
  final BaseState registerResendCode;
  final BaseState verify;

  //

  final BaseState isLoggedIn;
  final BaseState login;
  final BaseState logout;

  //

  final BaseState forgetPassword;
  final BaseState forgetPasswordResendCode;
  final BaseState confirmForgetPasswordCode;

  //

  final BaseState changePassword;

  //

  final BaseState changeEmail;
  final BaseState changeEmailResendCode;
  final BaseState confirmChangeEmailCode;

  ///
  final BaseState registerSocialUser;
  final BaseState getTokenAndProfileSocialLogin;
  final BaseState getProfile;
  final BaseState updateProfile;

  //
  final BaseState loginMethod;
  final BaseState deleteAccount;

  // final BaseState verifyFacebookToken;
  // final BaseState maidsFacebookRegister;
  // final BaseState verifyIosToken;
  // final BaseState maidsIosRegister;

  factory AuthState.initialState() => const AuthState(
        register: BaseInitState(),
        registerResendCode: BaseInitState(),
        verify: BaseInitState(),
        //
        isLoggedIn: BaseInitState(),
        login: BaseInitState(),
        logout: BaseInitState(),

        //
        forgetPassword: BaseInitState(),
        forgetPasswordResendCode: BaseInitState(),
        confirmForgetPasswordCode: BaseInitState(),
        //
        changePassword: BaseInitState(),
        //
        changeEmail: BaseInitState(),
        changeEmailResendCode: BaseInitState(),
        confirmChangeEmailCode: BaseInitState(),
        //
        registerSocialUser: BaseInitState(),
        getTokenAndProfileSocialLogin: BaseInitState(),
        getProfile: BaseInitState(),
        updateProfile: BaseInitState(),
        loginMethod: BaseInitState(),
        deleteAccount: BaseInitState(),

        // verifyFacebookToken: BaseInitState(),
        // maidsFacebookRegister: BaseInitState(),
        // verifyIosToken: BaseInitState(),
        // maidsIosRegister: BaseInitState(),
      );

  AuthState copyWith({
    BaseState? register,
    BaseState? registerResendCode,
    BaseState? verify,

    //
    BaseState? isLoggedIn,
    BaseState? login,
    BaseState? logout,
    //
    BaseState? forgetPassword,
    BaseState? forgetPasswordResendCode,
    BaseState? confirmForgetPasswordCode,
    //
    BaseState? changePassword,
    //
    BaseState? changeEmail,
    BaseState? changeEmailResendCode,
    BaseState? confirmChangeEmailCode,
    //
    BaseState? registerSocialUser,
    BaseState? getTokenAndProfileSocialLogin,
    BaseState? getProfile,
    BaseState? updateProfile,
    //
    BaseState? loginMethod,
    BaseState? deleteAccount,
    // BaseState? verifyFacebookToken,
    // BaseState? maidsFacebookRegister,
    // BaseState? verifyIosToken,
    // BaseState? maidsIosRegister,
  }) {
    return AuthState(
      register: register ?? this.register,
      registerResendCode: registerResendCode ?? this.registerResendCode,
      verify: verify ?? this.verify,
      //
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      login: login ?? this.login,
      logout: logout ?? this.logout,
      //
      forgetPassword: forgetPassword ?? this.forgetPassword,
      forgetPasswordResendCode:
          forgetPasswordResendCode ?? this.forgetPasswordResendCode,
      confirmForgetPasswordCode:
          confirmForgetPasswordCode ?? this.confirmForgetPasswordCode,
      //
      changePassword: changePassword ?? this.changePassword,
      //
      changeEmail: changeEmail ?? this.changeEmail,
      changeEmailResendCode:
          changeEmailResendCode ?? this.changeEmailResendCode,
      confirmChangeEmailCode:
          confirmChangeEmailCode ?? this.confirmChangeEmailCode,
      //
      registerSocialUser: registerSocialUser ?? this.registerSocialUser,
      getTokenAndProfileSocialLogin:
          getTokenAndProfileSocialLogin ?? this.getTokenAndProfileSocialLogin,
      getProfile: getProfile ?? this.getProfile,
      updateProfile: updateProfile ?? this.updateProfile,
      loginMethod: loginMethod ?? this.loginMethod,
      deleteAccount: deleteAccount ?? this.deleteAccount,
      // verifyFacebookToken: verifyFacebookToken ?? this.verifyFacebookToken,
      // maidsFacebookRegister:
      //     maidsFacebookRegister ?? this.maidsFacebookRegister,
      // verifyIosToken: verifyIosToken ?? this.verifyIosToken,
      // maidsIosRegister: maidsIosRegister ?? this.maidsIosRegister,
    );
  }

  @override
  String toString() {
    return '$AuthState('
        'register: $register, '
        'registerResendCode: $registerResendCode, '
        'verify: $verify, '
        //
        'isLoggedIn: $isLoggedIn, '
        'login: $login, '
        'logout: $logout, '
        //
        'forgetPassword: $forgetPassword, '
        'forgetPasswordResendCode: $forgetPasswordResendCode, '
        'confirmForgetPasswordCode: $confirmForgetPasswordCode, '
        //
        'changePassword: $changePassword, '
        //
        'changeEmail: $changeEmail, '
        'changeEmailResendCode: $changeEmailResendCode, '
        'confirmChangeEmailCode: $confirmChangeEmailCode'
        //
        'registerSocialUser: $registerSocialUser, '
        'getTokenAndProfileSocialLogin: $getTokenAndProfileSocialLogin, '
        'getUserProfile: $getProfile, '
        'updateProfile: $updateProfile, '
        'loginMethod: $loginMethod, '
        'deleteAccount: $deleteAccount'
        // 'verifyFacebookToken: $verifyFacebookToken, '
        // 'maidsFacebookRegister: $maidsFacebookRegister'
        // 'verifyIosToken: $verifyIosToken'
        // 'maidsIosRegister: $maidsIosRegister'
        ')\n';
  }
}

class LoginSuccess extends BaseSuccessState {
  final String? username;

  const LoginSuccess(this.username);

  @override
  List<Object?> get props => [username];

  @override
  String toString() => '$LoginSuccess(username: $username)';
}

class LoggedInAlreadySuccess extends BaseSuccessState {
  final ProfileEntity profile;

  const LoggedInAlreadySuccess({required this.profile});

  @override
  List<Object?> get props => [profile];

  @override
  String toString() => '$LoggedInAlreadySuccess';
}

class ForgetPasswordSuccess extends BaseSuccessState {
  final String username;

  const ForgetPasswordSuccess({required this.username});

  @override
  List<Object?> get props => [username];

  @override
  String toString() => '$ForgetPasswordSuccess(username: $username)';
}

class AppFirstLoadSuccess extends BaseSuccessState {
  const AppFirstLoadSuccess();

  @override
  List<Object?> get props => [];

  @override
  String toString() => '$AppFirstLoadSuccess';
}

class ContinueToLoginSuccess extends BaseSuccessState {
  const ContinueToLoginSuccess();

  @override
  List<Object?> get props => [];

  @override
  String toString() => '$ContinueToLoginSuccess';
}
