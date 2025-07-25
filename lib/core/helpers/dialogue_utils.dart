import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class DialogueUtils {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? ngeActionName,
    Function? ngeAction,
  }) {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName),
        ),
      );
    }

    if (ngeActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            ngeAction?.call();
          },
          child: Text(ngeActionName),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          title: Text(
            title ?? "",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
          actions: actions,
        );
      },
    );
  }
}
