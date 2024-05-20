import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maids/core/bloc/base/states/base_fail_state.dart';
import 'package:maids/core/bloc/base/states/base_loading_state.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/localization/app_language.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/navigation/nav_routes.dart';
import 'package:maids/core/utils/app_utils.dart';
import 'package:maids/core/utils/device_utils.dart';
import 'package:maids/core/widgets/animation/animated_column_widget.dart';
import 'package:maids/core/widgets/buttons/app_inkwell_widget.dart';
import 'package:maids/core/widgets/buttons/bouncing_button.dart';
import 'package:maids/core/widgets/dialogs/change_language_dailog.dart';
import 'package:maids/core/widgets/error/general_error_widget.dart';
import 'package:maids/core/widgets/general/app_checkbok.dart';
import 'package:maids/core/widgets/general/base_stateful_app_widget.dart';
import 'package:maids/core/widgets/general/horizontal_padding.dart';
import 'package:maids/core/widgets/general/maids_app_bar.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';
import 'package:maids/core/widgets/loader/app_loading_indicator.dart';
import 'package:maids/core/widgets/mixins/username_mixin.dart';
import 'package:maids/core/widgets/mixins/password_form_mixin.dart';
import 'package:maids/modules/auth/data/requests/sign_in_request_model.dart';
import 'package:maids/modules/auth/domain/blocs/auth_cubit.dart';
import 'package:maids/modules/auth/ui/widgets/app_title_header.dart';

class LoginPage extends BaseAppStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createBaseState() => _LoginPageState();
}

class _LoginPageState extends BaseAppState<LoginPage>
    with UsernameFormMixin, PasswordFormMixin {
  late AuthCubit _cubit;

  bool _rememberMe = true;

  @override
  void initState() {
    super.initState();
    _cubit = findDep<AuthCubit>();

    setUserNameText = "atuny0";
    setPasswordText = "9uQFF1Lh";
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: appTheme.appColors.appBarGreyColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: 0,
    );

    final width = DeviceUtils.getScaledWidth(context, 1);
    final height = DeviceUtils.getScaledHeight(context, 1);
    final size = min(height, height);
    const duration = Duration(
      milliseconds: AppDuration.shortAnimationDuration,
    );
    final topPadding = max(0.1.sw, 0.1.sh);
    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: topPadding * 1.2),
                physics: const BouncingScrollPhysics(),
                child: AnimatedContainer(
                  width: size,
                  duration: duration,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: appTheme.appColors.signCardInfoColor,
                    borderRadius: BorderRadius.circular(
                      AppRadius.radius24,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.horizontalPadding20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _logoWidget(width: width),
                      AnimationColumnWidget(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          verticalOffset: 70,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: topPadding),
                            AppTitleHeader(title: translate.log_in),
                            VerticalTextPadding.with28(),
                            _userEmailTextField(),
                            VerticalTextPadding.with16(),
                            _passwordTextField(),
                            VerticalTextPadding.with16(),
                            _rememberMeForgetPasswordWidget(),
                            VerticalTextPadding.with32(),
                            _buildLoginButton(context),
                            VerticalTextPadding.with40(),
                            _createNewAccountWidget(),
                            VerticalTextPadding.with16(),
                            _languageAndPrivacyPolicyWidget(),
                            VerticalTextPadding.with16(),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoWidget({required double width}) {
    final size = max(0.11.sw, 0.11.sh);
    const duration = Duration(
      milliseconds: AppDuration.shortAnimationDuration,
    );
    return SlideInDown(
      child: Align(
        heightFactor: 0,
        child: AnimatedContainer(
          duration: duration,
          width: size,
          height: size,
          child: AppImageWidget(
            path: Assets.images.appLauncher.path,
            boxFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _userEmailTextField() {
    return buildUsernameFormMixin(
      header: translate.user_name,
      hintText: translate.enter_your_user_name,
    );
  }

  /// Maids password widget
  Widget _passwordTextField() {
    return buildPasswordFieldMixin(
      header: translate.password,
      hintText: translate.enter_your_password,
    );
  }

  Widget _rememberMeForgetPasswordWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: AppCheckBox(
            value: _rememberMe,
            onChanged: (newValue) {
              _rememberMe = newValue;
              setState(() {});
            },
            title: translate.remember_me,
          ),
        ),
        // TextButton(
        //   onPressed: () {
        //     navigator.pushNamed(Routes.forgetPasswordPage);
        //   },
        //   child: Text(
        //     translate.forgot_password_question_mark,
        //     style: appTextStyle.regular14.copyWith(
        //       color: appTheme.appColors.textActiveColor,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _createNewAccountWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          translate.new_account,
          style: appTextStyle.regular14.copyWith(
            color: appTheme.appColors.hintColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _login() {
    if (validateUsername() && validatePassword()) {
      SignInRequestModel requestModel = SignInRequestModel(
        username: usernameValue,
        password: getPasswordValue(),
      );
      _cubit.login(
        request: requestModel,
        rememberMe: _rememberMe,
      );
    }
  }

  Widget _buildLoginButton(context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: _cubit,
      listenWhen: (oldState, newState) {
        return oldState.login != newState.login;
      },
      buildWhen: (oldState, newState) {
        return oldState.login != newState.login;
      },
      listener: (ctx, state) {
        final loginState = state.login;
        if (loginState is LoginSuccess) {
          final data = loginState;

          navigator.goNamed(Routes.homePage);

          if (loginState.username != null) {
            AppUtils.showToast(
              message: translate.welcome(loginState.username!),
              toastLength: Toast.LENGTH_LONG,
            );
          }
        }

        if (loginState is BaseFailState) {
          final error = loginState.error;

          final msg = AppErrorWidget.getErrorMsgByMessageCode(error);
          AppUtils.showErrorMessage(context: ctx, message: msg);
        }
      },
      builder: (context, state) {
        final isLoading = state.login is BaseLoadingState;
        return BouncingButton(
          buttonStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              appTheme.appColors.primaryColor,
            ),
          ),
          title: isLoading
              ? AppLoader(
                  size: AppLoaderSize.tiny,
                  iconColor: appTheme.appColors.iconReversedColor,
                )
              : null,
          text: translate.log_in,
          onPressed: isLoading ? null : _login,
        );
      },
    );
  }

  Widget _languageAndPrivacyPolicyWidget() {
    final appLang = context.watch<AppLanguageManager>();
    final flag = appLang.getFlag();
    final label = appLang.getLangLabel();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppInkWellWidget(
          onTap: () {
            AppUtils.appShowDialog(
              context: context,
              builder: (context) => const ChangeLanguageDialog(),
            );
          },
          child: Row(
            children: [
              Text('$flag '),
              Text(
                label,
                style: appTextStyle.regular12.copyWith(
                  color: appTheme.appColors.textActiveColor,
                  decoration: TextDecoration.underline,
                  decorationColor: appTheme.appColors.textActiveColor,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        HorizontalTextPadding.with8(),
        Container(
          width: 3,
          height: 3,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.appPrimaryColor,
          ),
        ),
        HorizontalTextPadding.with8(),
        AppInkWellWidget(
          onTap: () {
            // navigator.pushNamed(Routes.privacyPolicyPage);
          },
          child: Text(
            translate.privacy_policy,
            style: appTextStyle.regular12.copyWith(
              color: appTheme.appColors.textActiveColor,
              decoration: TextDecoration.underline,
              decorationColor: appTheme.appColors.textActiveColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
