// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "Min ${count} characters";

  static String m1(minLength) =>
      "This field should maximum length of ${minLength} characters";

  static String m2(minLength) =>
      "This field should minimum length of ${minLength} characters";

  static String m3(min, max) =>
      "This value should should be in range of (${min}, ${max})";

  static String m4(username) => "Welcome ${username}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "add_new_todo": MessageLookupByLibrary.simpleMessage("Add New Todo"),
        "added_successfully":
            MessageLookupByLibrary.simpleMessage("Added successfully"),
        "are_you_sure_to_continue": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to continue?"),
        "can_loading_text": MessageLookupByLibrary.simpleMessage("Can load"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "change_language":
            MessageLookupByLibrary.simpleMessage("Change Language"),
        "change_password":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "complete": MessageLookupByLibrary.simpleMessage("Complete"),
        "complete_todo": MessageLookupByLibrary.simpleMessage("Complete Todo"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "connection_error":
            MessageLookupByLibrary.simpleMessage("Connection Error"),
        "current_password":
            MessageLookupByLibrary.simpleMessage("Current password"),
        "dark_mode": MessageLookupByLibrary.simpleMessage("Dark mode"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "delete_todo": MessageLookupByLibrary.simpleMessage("Delete Todo"),
        "deleting": MessageLookupByLibrary.simpleMessage("Deleting"),
        "description": MessageLookupByLibrary.simpleMessage("description"),
        "dio_bad_request_error":
            MessageLookupByLibrary.simpleMessage("Bad Request!"),
        "dio_cancel_error": MessageLookupByLibrary.simpleMessage(
            "Request to API server was cancelled"),
        "dio_connection_timeout_error": MessageLookupByLibrary.simpleMessage(
            "Connection timeout with API server"),
        "dio_not_found_error":
            MessageLookupByLibrary.simpleMessage("Not found error!"),
        "dio_receive_connection_timeout_error":
            MessageLookupByLibrary.simpleMessage(
                "Receive timeout in connection with API server"),
        "dio_send_timeout_to_the_server": MessageLookupByLibrary.simpleMessage(
            "Send timeout in connection with API server"),
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "edit_todo": MessageLookupByLibrary.simpleMessage("Edit Todo"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "end_error_strings": MessageLookupByLibrary.simpleMessage(
            "========================================================"),
        "enter_your_current_password":
            MessageLookupByLibrary.simpleMessage("Enter your current password"),
        "enter_your_email":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "enter_your_password":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "enter_your_password_again":
            MessageLookupByLibrary.simpleMessage("Enter your password again"),
        "enter_your_user_name":
            MessageLookupByLibrary.simpleMessage("Enter your username"),
        "err_missing_user_id":
            MessageLookupByLibrary.simpleMessage("Missing user id"),
        "err_not_valid_username_or_password":
            MessageLookupByLibrary.simpleMessage(
                "Username or password is not valid."),
        "err_todo_with_this_id_not_found":
            MessageLookupByLibrary.simpleMessage("Todo with this id not found"),
        "error_internal_server":
            MessageLookupByLibrary.simpleMessage("Internal server error"),
        "error_unexpected":
            MessageLookupByLibrary.simpleMessage("Unexpected Error happened"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "idle_loading_text":
            MessageLookupByLibrary.simpleMessage("Release to load"),
        "in_progress": MessageLookupByLibrary.simpleMessage("In progress"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "languages": MessageLookupByLibrary.simpleMessage("Languages"),
        "light_mode": MessageLookupByLibrary.simpleMessage("Light mode"),
        "load_failed_text":
            MessageLookupByLibrary.simpleMessage("Loading failed"),
        "loading_text": MessageLookupByLibrary.simpleMessage("Loading..."),
        "log_in": MessageLookupByLibrary.simpleMessage("Log In"),
        "log_out": MessageLookupByLibrary.simpleMessage("Log out"),
        "logout_message": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out?"),
        "min_characters_count": m0,
        "more": MessageLookupByLibrary.simpleMessage("More"),
        "new_account": MessageLookupByLibrary.simpleMessage("New account?"),
        "no_data_found_please_check_your_internet_connection":
            MessageLookupByLibrary.simpleMessage(
                "No data found. Please check your internet connection"),
        "no_more_data_text":
            MessageLookupByLibrary.simpleMessage("No more data"),
        "no_result_found":
            MessageLookupByLibrary.simpleMessage("No Result Found"),
        "notifications_settings":
            MessageLookupByLibrary.simpleMessage("Notifications settings"),
        "optional": MessageLookupByLibrary.simpleMessage("Optional"),
        "or_continue_with":
            MessageLookupByLibrary.simpleMessage("Or continue with"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "press_again_to_exit":
            MessageLookupByLibrary.simpleMessage("Press again, to exit"),
        "privacy_policy":
            MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "processing": MessageLookupByLibrary.simpleMessage("Processing"),
        "remember_me": MessageLookupByLibrary.simpleMessage("Remember me"),
        "required": MessageLookupByLibrary.simpleMessage("Required"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "something_went_wrong_check_connection":
            MessageLookupByLibrary.simpleMessage(
                "Something went wrong, please check your internet connection and try again"),
        "something_went_wrong_please_try_again":
            MessageLookupByLibrary.simpleMessage(
                "Something went wrong,\n Please try again."),
        "start": MessageLookupByLibrary.simpleMessage("Start"),
        "start_error_strings": MessageLookupByLibrary.simpleMessage(
            "=============== Start Error Strings =================="),
        "tap_again_to_eit":
            MessageLookupByLibrary.simpleMessage("Tap again to exit!"),
        "todo": MessageLookupByLibrary.simpleMessage("Todo"),
        "todos": MessageLookupByLibrary.simpleMessage("Todos"),
        "try_again": MessageLookupByLibrary.simpleMessage("Try again"),
        "un_authorized_error":
            MessageLookupByLibrary.simpleMessage("Unauthorized Error"),
        "unknown_error": MessageLookupByLibrary.simpleMessage("UnKnown error"),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "updated_successfully":
            MessageLookupByLibrary.simpleMessage("Updated successfully"),
        "updating": MessageLookupByLibrary.simpleMessage("Updating"),
        "user_cancel_error":
            MessageLookupByLibrary.simpleMessage("Canceled by the user"),
        "user_email": MessageLookupByLibrary.simpleMessage("User email"),
        "user_name": MessageLookupByLibrary.simpleMessage("Username"),
        "validator_invalid_email":
            MessageLookupByLibrary.simpleMessage("Invalid email!"),
        "validator_invalid_url":
            MessageLookupByLibrary.simpleMessage("Invalid url!"),
        "validator_it_does_not_match":
            MessageLookupByLibrary.simpleMessage("It does not match"),
        "validator_should_be_with_maximum_length_of_characters": m1,
        "validator_should_be_with_minimum_length_of_characters": m2,
        "validator_should_be_with_range_of": m3,
        "validator_this_end_should_be_after_starting_date":
            MessageLookupByLibrary.simpleMessage(
                "End date should be after starting date"),
        "validator_this_field_is_required":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "validator_this_field_is_required_gsm":
            MessageLookupByLibrary.simpleMessage("The GSM is required"),
        "welcome": m4,
        "whoops": MessageLookupByLibrary.simpleMessage("Whoops!"),
        "whoops_info": MessageLookupByLibrary.simpleMessage("Whoops!!")
      };
}
