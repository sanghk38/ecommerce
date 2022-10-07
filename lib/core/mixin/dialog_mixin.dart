import 'package:flutter/material.dart';

import '../../di/injection.dart';
import '../helpers/dialog_helper.dart';

mixin DialogMixin<T extends StatefulWidget> on State<T> {
  late final DialogHelper _dialogHelper;
  @override
  void initState() {
    _dialogHelper = getIt<DialogHelper>();
    super.initState();
  }

  void snackBar(
    String content, {
    Duration duration = const Duration(seconds: 1),
  }) =>
      _dialogHelper.snackBar(
        context,
        content: content,
        duration: duration,
      );
}
