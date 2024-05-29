import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum DefaultPageRouteStyle { material, cupertino }

DefaultPageRouteStyle kDefaultPageRouteStyle = DefaultPageRouteStyle.material;

//show snack Bar
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

Future<T?> push<T>(BuildContext context, Widget page, {String? routeName}) {
  return Navigator.push<T>(context, defaultPage<T>(page, routeName: routeName));
}

Route<T> defaultPage<T>(Widget child, {String? routeName}) {
  final routeSetting =
      routeName != null ? RouteSettings(name: routeName) : null;
  return switch (kDefaultPageRouteStyle) {
    DefaultPageRouteStyle.material =>
      MaterialPageRoute(builder: (_) => child, settings: routeSetting),
    DefaultPageRouteStyle.cupertino =>
      CupertinoPageRoute(builder: (_) => child, settings: routeSetting),
  };
}

bool canPop(BuildContext context) {
  return Navigator.of(context).canPop();
}

void pop<T extends Object?>(BuildContext context, [T? result]) {
  Navigator.pop<T>(context, result);
}

void popToRoot(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}

Future<void> copyToClipboard(String value) {
  return Clipboard.setData(ClipboardData(text: value));
}

List<T> parseListNotNull<T extends Object?>({
  required List<dynamic> json,
  required T Function(Map<String, dynamic> json) fromJson,
}) {
  return (json).map((e) => fromJson(e as Map<String, dynamic>)).toList();
}

String? validateEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required!';
  }
  return null;
}
