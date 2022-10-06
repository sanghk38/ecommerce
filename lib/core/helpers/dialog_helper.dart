import 'package:flutter/material.dart';

abstract class DialogHelper {
  void snackBar(
    BuildContext context, {
    required String content,
    Duration duration = const Duration(seconds: 1),
  });
}

class DialogHelperImpl implements DialogHelper {
  @override
  void snackBar(
    BuildContext context, {
    required String content,
    Duration duration = const Duration(seconds: 1),
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: duration,
      ),
    );
  }
}
