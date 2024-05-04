import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobi_common/helper/helper.dart';

Future<T?> showAlertDialog<T>(
  BuildContext context, {
  String? title,
  String? content,
  VoidCallback? onClose,
  VoidCallback? onOk,
  String titleClose = 'Close',
  String titleOk = 'Ok',
  bool barrierDismissible = true,
  bool useRootNavigator = false,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: useRootNavigator,
    builder: (context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          TextButton(
              onPressed: () {
                pop(context);
                onClose?.call();
              },
              child: Text(titleClose)),
          if (onOk != null)
            TextButton(
                onPressed: () {
                  pop(context);
                  onOk();
                },
                child: Text(titleOk)),
        ],
      );
    },
  );
}
