import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maids/core/bloc/base/states/base_fail_state.dart';
import 'package:maids/core/bloc/base/states/base_success_state.dart';
import 'package:maids/core/constants/app_icon_size.dart';
import 'package:maids/core/constants/constants.dart';
import 'package:maids/core/di/di.dart';
import 'package:maids/core/generated_files/assets/assets.gen.dart';
import 'package:maids/core/managers/localization/app_translation.dart';
import 'package:maids/core/managers/navigation/nav_routes.dart';
import 'package:maids/core/managers/theme/app_them_manager.dart';
import 'package:maids/core/utils/app_utils.dart';
import 'package:maids/core/utils/device_utils.dart';
import 'package:maids/core/widgets/dialogs/change_language_dailog.dart';
import 'package:maids/core/widgets/dialogs/logout_dailog.dart';
import 'package:maids/core/widgets/error/general_error_widget.dart';
import 'package:maids/core/widgets/general/base_stateful_app_widget.dart';
import 'package:maids/core/widgets/general/maids_app_bar.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:maids/core/widgets/icons/custom_switch.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';
import 'package:maids/core/widgets/loader/app_loading_indicator.dart';
import 'package:maids/modules/auth/domain/blocs/auth_cubit.dart';
import 'package:maids/modules/auth/domain/entity/profile_entity.dart';

class MorePage extends BaseAppStatefulWidget {
  const MorePage({super.key});

  @override
  _MorePageState createBaseState() => _MorePageState();
}

class _MorePageState extends BaseAppState<MorePage> {
  late AuthCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = findDep<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.getScaledWidth(context, 1);
    double height = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      backgroundColor: appTheme.appColors.scaffoldBgColor,
      appBar: MaidsAppBar(
        title: translate.more,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: _cubit,
      builder: (context, state) {
        final profileState = state.getProfile;
        if (profileState is LoggedInAlreadySuccess) {
          final profile = profileState.profile;
          final switcher = SizedBox(
            width: 58,
            height: 45,
            child: FittedBox(
              child: GestureDetector(
                onTap: () {
                  _toggle(appTheme);
                },
                child: CustomSwitch(
                  switched: appTheme.isDarkMode,
                ),
              ),
            ),
          );
          final language = Text(
            languageManager.getLangLabel(),
            style: appTextStyle.light12.copyWith(
              color: appTheme.appColors.textColor,
            ),
          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalTextPadding.with24(),
              _buildImage(profile),
              VerticalTextPadding.with12(),
              Text(
                profile.fullName,
                style: appTextStyle.welcomeStyle.copyWith(
                  color: appTheme.appColors.textActiveColor,
                ),
              ),
              VerticalTextPadding.with24(),
              _buildItem(
                profile,
                Assets.icons.termsService.path,
                appTheme.isDarkMode
                    ? translate.dark_mode
                    : translate.light_mode,
                trailing: switcher,
              ),
              _buildItem(
                profile,
                Assets.icons.language.path,
                translate.language,
                trailing: language,
                onTap: () {
                  AppUtils.appShowDialog(
                    context: context,
                    builder: (_) {
                      return const ChangeLanguageDialog();
                    },
                  );
                },
              ),
              _buildItem(
                profile,
                Assets.icons.logout.path,
                translate.log_out,
                onTap: () {
                  _logoutAction(context: context);
                },
              ),
            ],
          );
        } else if (profileState is BaseFailState) {
          return AppErrorWidget(errorState: profileState);
        }
        return const AppLoader();
      },
    );
  }

  _logoutAction({required BuildContext context}) {
    AppUtils.appShowDialog(
      context: context,
      builder: (context) => BlocConsumer<AuthCubit, AuthState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state.logout is BaseSuccessState) {
            while (context.canPop()) {
              context.pop();
            }
            context.go(Uri(path: Routes.logInPage).toString());
          }
        },
        builder: (context, state) {
          final isLoggingOut = state.logout.isStateLoading;
          return LogoutDialog(
            onCancel: Navigator.of(context).pop,
            isOnConfirmLoading: isLoggingOut,
            onConfirm: () {
              _cubit.logout();
            },
          );
        },
      ),
    );
  }

  void _toggle(AppThemeManager themeStore) {
    if (themeStore.isDarkMode) {
      themeStore.toggleTheme(ThemeMode.light);
    } else {
      themeStore.toggleTheme(ThemeMode.dark);
    }
  }

  Widget _buildImage(ProfileEntity profile) {
    return AppImageWidget(
      path: profile.image,
      height: 100,
      width: 100,
      borderRadius: AppRadius.radius100,
    );
  }

  Widget _buildItem(
    ProfileEntity profile,
    String icon,
    String text, {
    Widget? trailing,
    Function()? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: AppDimens.space8,
      leading: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.space8,
        ),
        child: AppImageWidget(
          path: icon,
          width: AppIconSize.size_24,
          height: AppIconSize.size_24,
          color: appTheme.appColors.iconColor,
        ),
      ),
      title: Text(
        text,
        style: appTextStyle.regular14.copyWith(
          color: appTheme.appColors.textColor,
        ),
      ),
      trailing: trailing,
    );
  }
}
