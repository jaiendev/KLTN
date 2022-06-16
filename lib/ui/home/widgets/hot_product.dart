import 'package:app_kltn_trunghoan/common/widgets/title_and_seemore.dart';

import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class HotProduct extends StatelessWidget {
  const HotProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: TitleAndSeeMore(
              title: 'Top Screen',
              checkSeeMore: true,
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
    );
  }
}
