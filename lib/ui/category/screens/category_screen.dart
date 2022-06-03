import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/category_home_model.dart';
import 'package:app_kltn_trunghoan/ui/category/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                      Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: colorPrimary,
                        ),
                      ),
                      ButtonIcon(
                        onHandlePressed: () {},
                        icon: PhosphorIcons.shopping_cart_simple_light,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.sp),
                Container(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.sp, vertical: 10.sp),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.sp,
                      mainAxisSpacing: 10.sp,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: listCategories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        categories: listCategories[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
