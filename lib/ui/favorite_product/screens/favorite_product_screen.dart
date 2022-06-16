import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class FavoriteProductScreen extends StatefulWidget {
  FavoriteProductScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteProductScreen> createState() => _FavoriteProductScreenState();
}

class _FavoriteProductScreenState extends State<FavoriteProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarTitleBack(
        context,
        'Favorite Product',
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Text(
                  'Your Favorite\nProduct',
                  style: TextStyle(
                    color: colorPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.25.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              // Container(
              //   child: GridView.builder(
              //     padding: EdgeInsets.symmetric(horizontal: 16.sp),
              //     physics: NeverScrollableScrollPhysics(),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 12.sp,
              //       mainAxisSpacing: 10.sp,
              //       childAspectRatio: 3 / 4.4,
              //     ),
              //     itemCount: productList.length,
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return ProductCard(
              //         productModel: productList[index],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
