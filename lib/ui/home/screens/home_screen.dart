import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/common/widgets/search_box.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/categories_home.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/hot_product.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/product_recommend_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonIcon(
                        onHandlePressed: () {},
                        icon: PhosphorIcons.squares_four_light,
                      ),
                      Row(
                        children: [
                          ButtonIcon(
                            onHandlePressed: () {
                              AppNavigator.push(Routes.CART);
                            },
                            icon: PhosphorIcons.shopping_cart_simple_light,
                          ),
                          SizedBox(width: 10.sp),
                          CustomNetworkImage(
                            urlToImage: urlImageMan,
                            height: 28.sp,
                            width: 28.sp,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Text(
                    'Best technology \naccessories in Vietnam.',
                    style: TextStyle(
                      color: colorPrimary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 15.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    children: [
                      SearchBox(),
                      SizedBox(width: 3.w),
                      ButtonIcon(
                        icon: PhosphorIcons.sliders_horizontal_light,
                        onHandlePressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: ProductRecommendCard(),
                ),
                SizedBox(height: 20.sp),
                CategoriesHome(),
                SizedBox(height: 20.sp),
                HotProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
