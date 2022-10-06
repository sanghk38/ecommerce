import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/bloc/login/login_bloc.dart';
import 'package:ecommerce/bloc/login/login_state.dart';
import 'package:ecommerce/core/constants/routes/route_name.dart';
import 'package:ecommerce/core/resuource/app_images.dart';
import 'package:ecommerce/core/translations/locale_keys.g.dart';
import 'package:ecommerce/di/injection.dart';
import 'package:ecommerce/pages/home/home_page.dart';
import 'package:ecommerce/widgets/app_button.dart';
import 'package:ecommerce/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/signin';

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _signinnBloc = getIt<LoginBloc>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _signinnBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: _signinnBloc,
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.goNamed(RouteName.homePage);
        }
      },
      child: GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                100.verticalSpace,
                Padding(
                  padding: REdgeInsets.only(left: 14, bottom: 36),
                  child: Text(
                    LocaleKeys.login_login.tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 34.sp,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    children: [
                      AppTextFromField(
                        controller: _emailController,
                        hint: LocaleKeys.login_email.tr(),
                        label: LocaleKeys.login_email.tr(),
                        isRequired: true,
                      ),
                      15.verticalSpace,
                      AppTextFromField(
                        controller: _passwordController,
                        hint: LocaleKeys.login_password.tr(),
                        label: LocaleKeys.login_password.tr(),
                        isRequired: true,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(right: 22),
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.signUp.tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Colors.black),
                          ),
                          7.horizontalSpace,
                          SvgPicture.asset(AppImages.retunt)
                        ],
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: AppButton(
                      mainAxisSize: MainAxisSize.max,
                      borderRadius: 25.r,
                      title: LocaleKeys.login.tr(),
                      onPressed: () {
                        _signinnBloc.login(
                          username: _emailController.text,
                          password: _passwordController.text,
                        );
                      }),
                ),
                100.verticalSpace,
                Center(
                  child: Text(
                    LocaleKeys.login_or.tr(),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 96,
                      height: 64,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                          ),
                          child: SvgPicture.asset(AppImages.google)),
                    ),
                    16.horizontalSpace,
                    SizedBox(
                      width: 96,
                      height: 64,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                          ),
                          child: SvgPicture.asset(AppImages.fb)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
