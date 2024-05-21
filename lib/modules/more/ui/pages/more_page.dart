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
import 'package:maids/core/widgets/general/horizontal_padding.dart';
import 'package:maids/core/widgets/general/vertical_padding.dart';
import 'package:maids/core/widgets/images/app_image_widget.dart';
import 'package:maids/core/widgets/loader/app_loading_indicator.dart';
import 'package:maids/modules/auth/domain/blocs/auth_cubit.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/icons/custom_switch.dart';

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
    _cubit.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.getScaledWidth(context, 1);
    double height = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      backgroundColor: appTheme.appColors.scaffoldBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appTheme.appColors.splashAppBarColor,
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
          return Column(
            children: [
              AppImageWidget(
                path: profileState.profile.image,
                height: 100,
                width: 100,
                borderRadius: AppRadius.radius100,
              ),
              VerticalTextPadding.with24(),
              ListTile(
                horizontalTitleGap: AppDimens.space8,
                leading: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.space8,
                  ),
                  child: AppImageWidget(
                    path: Assets.icons.termsService.path,
                    width: AppIconSize.size_24,
                    height: AppIconSize.size_24,
                    color: appTheme.appColors.iconColor,
                  ),
                ),
                title: Text(
                  appTheme.isDarkMode
                      ? translate.dark_mode
                      : translate.light_mode,
                  style: appTextStyle.regular14.copyWith(
                    color: appTheme.appColors.textColor,
                  ),
                ),
                trailing: SizedBox(
                  width: 65,
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
                ),
              ),
              buildListTile(
                context: context,
                icon: Assets.icons.language.path,
                title: translate.language,
                trailing: languageManager.getLangLabel(),
                onTap: () {
                  AppUtils.appShowDialog(
                    context: context,
                    builder: (_) {
                      return const ChangeLanguageDialog();
                    },
                  );
                },
              ),
              ListTile(
                onTap: () {
                  _logoutAction(context: context);
                },
                title: Row(
                  children: [
                    AppImageWidget(
                      path: Assets.icons.logout.path,
                      borderRadius: AppRadius.radius100,
                      width: 28,
                      height: 28,
                    ),
                    HorizontalTextPadding.with8(),
                    Text(
                      translate.log_out,
                      style: appTextStyle.semiBold16.copyWith(
                        color: appTheme.appColors.textColor,
                      ),
                    ),
                  ],
                ),
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
            // clearAndResetAllControllers();
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

  Widget buildListTile({
    required BuildContext context,
    required String icon,
    required String title,
    String? trailing,
    required Function() onTap,
  }) {
    AppThemeManager themeStore = Provider.of<AppThemeManager>(context);
    return ListTile(
      horizontalTitleGap: AppDimens.space8,
      // contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.space8),
        child: AppImageWidget(
          path: icon,
          width: AppIconSize.size_24,
          height: AppIconSize.size_24,
          color: themeStore.appColors.iconColor,
        ),
      ),
      title: Text(
        title,
        style: appTextStyle.regular12.copyWith(
          color: themeStore.appColors.headerTextFieldColor,
        ),
      ),
      trailing: trailing != null
          ? Text(
              trailing,
              style: appTextStyle.regular12.copyWith(
                color: themeStore.appColors.headerTextFieldColor,
              ),
            )
          : null,
      onTap: onTap,
    );
  }

  void _toggle(AppThemeManager themeStore) {
    if (themeStore.isDarkMode) {
      themeStore.toggleTheme(ThemeMode.light);
    } else {
      themeStore.toggleTheme(ThemeMode.dark);
    }
  }
}
