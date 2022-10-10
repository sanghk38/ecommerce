import 'package:ecommerce/core/resuource/app_images.dart';
import 'package:ecommerce/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewItem extends StatelessWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      child: Stack(
        children: [
          RPadding(
            padding: REdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(AppImages.anh,
                          width: 150, height: 180, fit: BoxFit.fill),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        width: 36,
                        height: 36,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {},
                          child: Icon(
                            Icons.favorite_border,
                            color: Color.fromRGBO(218, 218, 218, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                Text(
                  'Dorothy Perkins',
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                4.verticalSpace,
                Text(
                  'Evening Dress',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      r'15$',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14.sp,
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough),
                    ),
                    4.horizontalSpace,
                    Text(
                      r'12$',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
