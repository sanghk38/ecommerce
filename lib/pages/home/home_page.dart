import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/constants/routes/route_name.dart';
import 'package:ecommerce/core/translations/locale_keys.g.dart';
import 'package:ecommerce/pages/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.home_title.tr()),
            ElevatedButton(
              onPressed: () {
                context.goNamed(RouteName.loginPage);              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
