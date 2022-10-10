import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/translations/locale_keys.g.dart';
import 'package:ecommerce/pages/dashboard/animation.dart';
import 'package:ecommerce/product/new/item_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Animations(),
              Divider(
                height: 3.h,
                color: Color(0xFFF4F4F4),
              ),
              Padding(
                padding: REdgeInsets.only(top: 33, left: 14, right: 14),
                child: _viewText(context),
              ),
              22.verticalSpace,
              SizedBox(
                height: 290.sp,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                          margin: REdgeInsets.all(6),
                          child: NewItem()),
                    );
                  },
                  separatorBuilder: (_, __) => 20.verticalSpace,
                  itemCount: 20,
                ),
              ),
              Divider(
                height: 3.h,
                color: Color(0xFFF4F4F4),
              ),
              Padding(
                padding: REdgeInsets.only(top: 33, left: 14, right: 14),
                child: _viewTextSale(context),
              ),
              22.verticalSpace,
              SizedBox(
                height: 290.sp,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                          margin: REdgeInsets.all(6),
                          child: NewItem()),
                    );
                  },
                  separatorBuilder: (_, __) => 20.verticalSpace,
                  itemCount: 20,
                ),
              ),
              Image.network('https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
              Image.network('https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
              Image.network('https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _viewText(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.newView.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 34.sp,
                      color: Colors.black),
                ),
                Text(
                  LocaleKeys.view_all.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: Colors.black),
                ),
              ],
            ),
            Text(
              LocaleKeys.slogin.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11.sp,
                  color: Colors.black),
            ),
          ],
        )
      ],
    );
  }
  Widget _viewTextSale(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.sale.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 34.sp,
                      color: Colors.black),
                ),
                Text(
                  LocaleKeys.view_all.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: Colors.black),
                ),
              ],
            ),
            Text(
              LocaleKeys.slogin_sale.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11.sp,
                  color: Colors.black),
            ),
          ],
        )
      ],
    );
  }
}
