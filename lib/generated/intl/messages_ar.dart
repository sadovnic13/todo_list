// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(date) => "تاريخ الاستعداد: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("لديك حساب بالفعل؟"),
        "creationDate": MessageLookupByLibrary.simpleMessage("تاريخ الإنشاء"),
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "description": MessageLookupByLibrary.simpleMessage("الوصف"),
        "edit": MessageLookupByLibrary.simpleMessage("تحرير"),
        "error": MessageLookupByLibrary.simpleMessage("خطأ!"),
        "finishDate": MessageLookupByLibrary.simpleMessage("تاريخ الانتهاء"),
        "hideDoneTasks":
            MessageLookupByLibrary.simpleMessage("إخفاء المهام المنجزة"),
        "logIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "noAccountYet":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب بعد؟"),
        "performance": MessageLookupByLibrary.simpleMessage("الأداء"),
        "pleaseEnterText":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال النص"),
        "readyDateX": m0,
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "signIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "signUp": MessageLookupByLibrary.simpleMessage("اشترك"),
        "title": MessageLookupByLibrary.simpleMessage("العنوان"),
        "youDontHavePlans":
            MessageLookupByLibrary.simpleMessage("لا توجد لديك خطط"),
        "yourTodoList":
            MessageLookupByLibrary.simpleMessage("قائمة المهام الخاصة بك")
      };
}
