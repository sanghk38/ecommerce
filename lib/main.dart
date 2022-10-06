import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/di/injection.dart';
import 'package:flutter/material.dart';
import 'core/utils/localization_util.dart';
import 'pages/application.dart';


void main() {
  runZonedGuarded<Future<void>>(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await registerDependencies();
      await EasyLocalization.ensureInitialized();
      runApp(
        EasyLocalization(
          supportedLocales: LocalizationUtil.supportedLocales,
          path: 'assets/translations',
          fallbackLocale: LocalizationUtil.defaultLocale,
          child: const Application(),
        ),
      );
    },
        (_, __) {
      // Add crashlytics if needed
    },
  );
}
