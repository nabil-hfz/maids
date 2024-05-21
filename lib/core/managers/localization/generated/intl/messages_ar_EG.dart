// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar_EG locale. All the
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
  String get localeName => 'ar_EG';

  static String m0(count) => "الحد الأدنى ${count} حروف";

  static String m1(minLength) =>
      "يجب أن يكون هذا الحقل طوله الأقصى ${minLength} من الأحرف";

  static String m2(minLength) =>
      "يجب أن يكون هذا الحقل طوله الأدنى ${minLength} من الأحرف";

  static String m3(min, max) =>
      "يجب أن يكون هذا القيمة في النطاق (${min}, ${max})";

  static String m4(username) => "مرحبًا ${username}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "are_you_sure_to_continue": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد أنك تريد الاستمرار؟"),
        "can_loading_text":
            MessageLookupByLibrary.simpleMessage("يمكن التحميل"),
        "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
        "change_language": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
        "change_password":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "complete": MessageLookupByLibrary.simpleMessage("Complete"),
        "complete_todo": MessageLookupByLibrary.simpleMessage("Complete Todo"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور"),
        "connection_error":
            MessageLookupByLibrary.simpleMessage("خطأ في الاتصال"),
        "current_password":
            MessageLookupByLibrary.simpleMessage("كلمة المرور الحالية"),
        "dark_mode": MessageLookupByLibrary.simpleMessage("الوضع الداكن"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "delete_todo": MessageLookupByLibrary.simpleMessage("Delete Todo"),
        "deleting": MessageLookupByLibrary.simpleMessage("Deleting"),
        "description": MessageLookupByLibrary.simpleMessage("description"),
        "dio_bad_request_error":
            MessageLookupByLibrary.simpleMessage("طلب سيء!"),
        "dio_cancel_error":
            MessageLookupByLibrary.simpleMessage("تم إلغاء طلب إلى خادم API"),
        "dio_connection_timeout_error": MessageLookupByLibrary.simpleMessage(
            "انتهت مهلة الاتصال مع خادم API"),
        "dio_not_found_error":
            MessageLookupByLibrary.simpleMessage("خطأ في العثور!"),
        "dio_receive_connection_timeout_error":
            MessageLookupByLibrary.simpleMessage(
                "انتهت مهلة الاستلام في الاتصال مع خادم API"),
        "dio_send_timeout_to_the_server": MessageLookupByLibrary.simpleMessage(
            "انتهت مهلة الإرسال في الاتصال مع خادم API"),
        "done": MessageLookupByLibrary.simpleMessage("تم"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
        "end_error_strings": MessageLookupByLibrary.simpleMessage(
            "========================================================"),
        "enter_your_current_password":
            MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور الحالية"),
        "enter_your_email":
            MessageLookupByLibrary.simpleMessage("أدخل بريدك الإلكتروني"),
        "enter_your_password":
            MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور الخاصة بك"),
        "enter_your_password_again":
            MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور مرة أخرى"),
        "enter_your_user_name":
            MessageLookupByLibrary.simpleMessage("أدخل اسم المستخدم الخاص بك"),
        "err_missing_user_id":
            MessageLookupByLibrary.simpleMessage("حقل ال Id مطلوب"),
        "err_not_valid_username_or_password":
            MessageLookupByLibrary.simpleMessage(
                "اسم المستخدم أو كلمة المرور غير صالحة."),
        "err_todo_with_this_id_not_found":
            MessageLookupByLibrary.simpleMessage("Todo with this id not found"),
        "error_internal_server":
            MessageLookupByLibrary.simpleMessage("خطأ في الخادم الداخلي"),
        "error_unexpected":
            MessageLookupByLibrary.simpleMessage("حدث خطأ غير متوقع"),
        "home": MessageLookupByLibrary.simpleMessage("الصفحة الرئيسية"),
        "idle_loading_text":
            MessageLookupByLibrary.simpleMessage("تحرير للتحميل"),
        "in_progress": MessageLookupByLibrary.simpleMessage("In progress"),
        "language": MessageLookupByLibrary.simpleMessage("اللغة"),
        "languages": MessageLookupByLibrary.simpleMessage("اللغات"),
        "light_mode": MessageLookupByLibrary.simpleMessage("Light mode"),
        "load_failed_text":
            MessageLookupByLibrary.simpleMessage("فشل في التحميل"),
        "loading_text": MessageLookupByLibrary.simpleMessage("جارٍ التحميل..."),
        "log_in": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "log_out": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "logout_message": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد أنك تريد تسجيل الخروج؟"),
        "min_characters_count": m0,
        "more": MessageLookupByLibrary.simpleMessage("مزيد"),
        "new_account": MessageLookupByLibrary.simpleMessage("حساب جديد؟"),
        "no_more_data_text":
            MessageLookupByLibrary.simpleMessage("لا توجد مزيد من البيانات"),
        "notifications_settings":
            MessageLookupByLibrary.simpleMessage("إعدادات الإشعارات"),
        "optional": MessageLookupByLibrary.simpleMessage("خياري"),
        "or_continue_with":
            MessageLookupByLibrary.simpleMessage("أو استمر باستخدام"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "privacy_policy":
            MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
        "processing": MessageLookupByLibrary.simpleMessage("جارٍ المعالجة"),
        "remember_me":
            MessageLookupByLibrary.simpleMessage("تذكرني للمرة القادمة"),
        "required": MessageLookupByLibrary.simpleMessage("مطلوب"),
        "reset": MessageLookupByLibrary.simpleMessage("إعادة تعيين"),
        "something_went_wrong_check_connection":
            MessageLookupByLibrary.simpleMessage(
                "حدث خطأ ما ، يرجى التحقق من اتصال الإنترنت الخاص بك والمحاولة مرة أخرى"),
        "something_went_wrong_please_try_again":
            MessageLookupByLibrary.simpleMessage(
                "حدث خطأ ما ، يرجى المحاولة مرة أخرى."),
        "start": MessageLookupByLibrary.simpleMessage("بداية"),
        "start_error_strings": MessageLookupByLibrary.simpleMessage(
            "================ بداية سلاسل الأخطاء ================="),
        "tap_again_to_eit":
            MessageLookupByLibrary.simpleMessage("اضغط مرة أخرى للخروج!"),
        "todo": MessageLookupByLibrary.simpleMessage("Todo"),
        "todos": MessageLookupByLibrary.simpleMessage("Todos"),
        "try_again": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
        "un_authorized_error":
            MessageLookupByLibrary.simpleMessage("خطأ غير مصرح به"),
        "unknown_error": MessageLookupByLibrary.simpleMessage("خطأ غير معروف"),
        "updating": MessageLookupByLibrary.simpleMessage("Updating"),
        "user_cancel_error":
            MessageLookupByLibrary.simpleMessage("تم الإلغاء بواسطة المستخدم"),
        "user_email": MessageLookupByLibrary.simpleMessage("بريد المستخدم"),
        "user_name": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
        "validator_invalid_email":
            MessageLookupByLibrary.simpleMessage("بريد إلكتروني غير صالح!"),
        "validator_invalid_url":
            MessageLookupByLibrary.simpleMessage("رابط غير صالح!"),
        "validator_it_does_not_match":
            MessageLookupByLibrary.simpleMessage("لا يتطابق"),
        "validator_should_be_with_maximum_length_of_characters": m1,
        "validator_should_be_with_minimum_length_of_characters": m2,
        "validator_should_be_with_range_of": m3,
        "validator_this_end_should_be_after_starting_date":
            MessageLookupByLibrary.simpleMessage(
                "يجب أن يكون تاريخ الانتهاء بعد تاريخ البدء"),
        "validator_this_field_is_required":
            MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب"),
        "validator_this_field_is_required_gsm":
            MessageLookupByLibrary.simpleMessage("GSM مطلوب"),
        "welcome": m4,
        "whoops": MessageLookupByLibrary.simpleMessage("عفوًا!")
      };
}
