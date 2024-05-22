import 'dart:developer' as dev;

abstract class Logger {
  static void debug(dynamic value) {
    // if (!isProduction)
    {
      dev.log(
          '===============================[TAG]===============================');
      dev.log('$value');
      dev.log(
          '=========================================================================');
    }
  }

  static Future<void> error(
    dynamic error,
    dynamic stack, {
    recordFirebase = true,
  }) async {
    final timestamp = DateTime.now().toIso8601String();
    final errorContent =
        "[$timestamp] Error: $error\nStack Trace: $stack\n\n\n\n";
    dev.log(errorContent);
  }
}
