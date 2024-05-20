// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Translations {
  Translations();

  static Translations? _current;

  static Translations get current {
    assert(_current != null,
        'No instance of Translations was loaded. Try to initialize the Translations delegate before accessing Translations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Translations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Translations();
      Translations._current = instance;

      return instance;
    });
  }

  static Translations of(BuildContext context) {
    final instance = Translations.maybeOf(context);
    assert(instance != null,
        'No instance of Translations present in the widget tree. Did you add Translations.delegate in localizationsDelegates?');
    return instance!;
  }

  static Translations? maybeOf(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  /// `=============== Start Error Strings ==================`
  String get start_error_strings {
    return Intl.message(
      '=============== Start Error Strings ==================',
      name: 'start_error_strings',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized Error`
  String get un_authorized_error {
    return Intl.message(
      'Unauthorized Error',
      name: 'un_authorized_error',
      desc: '',
      args: [],
    );
  }

  /// `Connection Error`
  String get connection_error {
    return Intl.message(
      'Connection Error',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Canceled by the user`
  String get user_cancel_error {
    return Intl.message(
      'Canceled by the user',
      name: 'user_cancel_error',
      desc: '',
      args: [],
    );
  }

  /// `UnKnown error`
  String get unknown_error {
    return Intl.message(
      'UnKnown error',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get error_internal_server {
    return Intl.message(
      'Internal server error',
      name: 'error_internal_server',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please check your internet connection and try again`
  String get something_went_wrong_check_connection {
    return Intl.message(
      'Something went wrong, please check your internet connection and try again',
      name: 'something_went_wrong_check_connection',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong,\n Please try again.`
  String get something_went_wrong_please_try_again {
    return Intl.message(
      'Something went wrong,\n Please try again.',
      name: 'something_went_wrong_please_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error happened`
  String get error_unexpected {
    return Intl.message(
      'Unexpected Error happened',
      name: 'error_unexpected',
      desc: '',
      args: [],
    );
  }

  /// `Request to API server was cancelled`
  String get dio_cancel_error {
    return Intl.message(
      'Request to API server was cancelled',
      name: 'dio_cancel_error',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with API server`
  String get dio_connection_timeout_error {
    return Intl.message(
      'Connection timeout with API server',
      name: 'dio_connection_timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout in connection with API server`
  String get dio_receive_connection_timeout_error {
    return Intl.message(
      'Receive timeout in connection with API server',
      name: 'dio_receive_connection_timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout in connection with API server`
  String get dio_send_timeout_to_the_server {
    return Intl.message(
      'Send timeout in connection with API server',
      name: 'dio_send_timeout_to_the_server',
      desc: '',
      args: [],
    );
  }

  /// `Bad Request!`
  String get dio_bad_request_error {
    return Intl.message(
      'Bad Request!',
      name: 'dio_bad_request_error',
      desc: '',
      args: [],
    );
  }

  /// `Not found error!`
  String get dio_not_found_error {
    return Intl.message(
      'Not found error!',
      name: 'dio_not_found_error',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email!`
  String get validator_invalid_email {
    return Intl.message(
      'Invalid email!',
      name: 'validator_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid url!`
  String get validator_invalid_url {
    return Intl.message(
      'Invalid url!',
      name: 'validator_invalid_url',
      desc: '',
      args: [],
    );
  }

  /// `It does not match`
  String get validator_it_does_not_match {
    return Intl.message(
      'It does not match',
      name: 'validator_it_does_not_match',
      desc: '',
      args: [],
    );
  }

  /// `This field should minimum length of {minLength} characters`
  String validator_should_be_with_minimum_length_of_characters(int minLength) {
    return Intl.message(
      'This field should minimum length of $minLength characters',
      name: 'validator_should_be_with_minimum_length_of_characters',
      desc: 'This is the text for the text min length validator',
      args: [minLength],
    );
  }

  /// `This field should maximum length of {minLength} characters`
  String validator_should_be_with_maximum_length_of_characters(int minLength) {
    return Intl.message(
      'This field should maximum length of $minLength characters',
      name: 'validator_should_be_with_maximum_length_of_characters',
      desc: 'This is the text for the text max length validator',
      args: [minLength],
    );
  }

  /// `This value should should be in range of ({min}, {max})`
  String validator_should_be_with_range_of(Object min, Object max) {
    return Intl.message(
      'This value should should be in range of ($min, $max)',
      name: 'validator_should_be_with_range_of',
      desc: '',
      args: [min, max],
    );
  }

  /// `This field is required`
  String get validator_this_field_is_required {
    return Intl.message(
      'This field is required',
      name: 'validator_this_field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `The GSM is required`
  String get validator_this_field_is_required_gsm {
    return Intl.message(
      'The GSM is required',
      name: 'validator_this_field_is_required_gsm',
      desc: '',
      args: [],
    );
  }

  /// `End date should be after starting date`
  String get validator_this_end_should_be_after_starting_date {
    return Intl.message(
      'End date should be after starting date',
      name: 'validator_this_end_should_be_after_starting_date',
      desc: '',
      args: [],
    );
  }

  /// `========================================================`
  String get end_error_strings {
    return Intl.message(
      '========================================================',
      name: 'end_error_strings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get log_in {
    return Intl.message(
      'Log In',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `User email`
  String get user_email {
    return Intl.message(
      'User email',
      name: 'user_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Notifications settings`
  String get notifications_settings {
    return Intl.message(
      'Notifications settings',
      name: 'notifications_settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get current_password {
    return Intl.message(
      'Current password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your current password`
  String get enter_your_current_password {
    return Intl.message(
      'Enter your current password',
      name: 'enter_your_current_password',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password again`
  String get enter_your_password_again {
    return Intl.message(
      'Enter your password again',
      name: 'enter_your_password_again',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember_me {
    return Intl.message(
      'Remember me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Tap again to exit!`
  String get tap_again_to_eit {
    return Intl.message(
      'Tap again to exit!',
      name: 'tap_again_to_eit',
      desc: '',
      args: [],
    );
  }

  /// `New account?`
  String get new_account {
    return Intl.message(
      'New account?',
      name: 'new_account',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {username}`
  String welcome(String username) {
    return Intl.message(
      'Welcome $username',
      name: 'welcome',
      desc: 'This is a greeting text when user logs in',
      args: [username],
    );
  }

  /// `Or continue with`
  String get or_continue_with {
    return Intl.message(
      'Or continue with',
      name: 'or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Whoops!`
  String get whoops {
    return Intl.message(
      'Whoops!',
      name: 'whoops',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get try_again {
    return Intl.message(
      'Try again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get optional {
    return Intl.message(
      'Optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get log_out {
    return Intl.message(
      'Log out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logout_message {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logout_message',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get user_name {
    return Intl.message(
      'Username',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get enter_your_user_name {
    return Intl.message(
      'Enter your username',
      name: 'enter_your_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Username or password is not valid.`
  String get err_not_valid_username_or_password {
    return Intl.message(
      'Username or password is not valid.',
      name: 'err_not_valid_username_or_password',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Todos`
  String get todos {
    return Intl.message(
      'Todos',
      name: 'todos',
      desc: '',
      args: [],
    );
  }

  /// `Deleting`
  String get deleting {
    return Intl.message(
      'Deleting',
      name: 'deleting',
      desc: '',
      args: [],
    );
  }

  /// `Min {count} characters`
  String min_characters_count(Object count) {
    return Intl.message(
      'Min $count characters',
      name: 'min_characters_count',
      desc: '',
      args: [count],
    );
  }

  /// `Add New Todo`
  String get add_new_todo {
    return Intl.message(
      'Add New Todo',
      name: 'add_new_todo',
      desc: '',
      args: [],
    );
  }

  /// `Edit Todo`
  String get edit_todo {
    return Intl.message(
      'Edit Todo',
      name: 'edit_todo',
      desc: '',
      args: [],
    );
  }

  /// `Added successfully`
  String get added_successfully {
    return Intl.message(
      'Added successfully',
      name: 'added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Updated successfully`
  String get updated_successfully {
    return Intl.message(
      'Updated successfully',
      name: 'updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Todo`
  String get todo {
    return Intl.message(
      'Todo',
      name: 'todo',
      desc: '',
      args: [],
    );
  }

  /// `description`
  String get description {
    return Intl.message(
      'description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Eliberați pentru a încărca`
  String get idle_loading_text {
    return Intl.message(
      'Eliberați pentru a încărca',
      name: 'idle_loading_text',
      desc: '',
      args: [],
    );
  }

  /// `Se încarcă...`
  String get loading_text {
    return Intl.message(
      'Se încarcă...',
      name: 'loading_text',
      desc: '',
      args: [],
    );
  }

  /// `Niciun alt date disponibil`
  String get no_more_data_text {
    return Intl.message(
      'Niciun alt date disponibil',
      name: 'no_more_data_text',
      desc: '',
      args: [],
    );
  }

  /// `Încărcarea a eșuat`
  String get load_failed_text {
    return Intl.message(
      'Încărcarea a eșuat',
      name: 'load_failed_text',
      desc: '',
      args: [],
    );
  }

  /// `Poate încărca`
  String get can_loading_text {
    return Intl.message(
      'Poate încărca',
      name: 'can_loading_text',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Translations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'EG'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
