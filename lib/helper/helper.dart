import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
