import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String message, {
  Color? backgroundColor,
  Color? textColor = Colors.white,
  int milliseconds = 4000,
  SnackBarAction? action,
  Function? onClosed,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message, style: TextStyle(color: textColor)),
        backgroundColor: backgroundColor,
        duration: Duration(milliseconds: milliseconds),
        action: action,
      ),
    ).closed.then((value) => onClosed?.call());
}
