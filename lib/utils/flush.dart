import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ShowFlushBar {
  static Future showError(String error,
      {required BuildContext context, int duration = 1}) async {
    final flushBar = Flushbar(
      backgroundColor: Colors.red.withOpacity(0.8),
      borderColor: Colors.red,
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      messageText: Text(
        error,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      positionOffset: 12,
      duration: Duration(seconds: duration),
    );
    await flushBar.show(context);
  }

  static Future showSuccess(
      {String? message,
      required BuildContext context,
      Function()? perform}) async {
    final flushBar = Flushbar(
      backgroundColor: Colors.green.withOpacity(0.8),
      borderColor: Colors.green,
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      messageText: Text(
        message ?? 'Successful',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      positionOffset: 12,
      duration: const Duration(seconds: 1),
    );
    await flushBar.show(context);
    if (perform != null) {
      perform();
    }
  }
}
