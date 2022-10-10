import 'package:ecommerce/core/resuource/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCard extends StatelessWidget {
  final Widget child;

  const ItemCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: child,
        ),
        // SizedBox(
        //   width: 36,
        //   height: 36,
        //   child: FloatingActionButton(
        //     backgroundColor: Colors.white,
        //     onPressed: () {},
        //     child: Icon(
        //       Icons.favorite_border,
        //       color: Color.fromRGBO(218, 218, 218, 1),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
