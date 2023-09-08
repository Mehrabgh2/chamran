// import 'package:sentry_flutter/sentry_flutter.dart';

import 'app_util.dart';

class SentryErrorReport {
  void captureException(error, stack) async {
    if (error != null && stack != null) {
      AppUtil.print('$error\n$stack');
    }
    // await Sentry.captureException(
    //   error,
    //   stackTrace: stack,
    // );
  }
}
