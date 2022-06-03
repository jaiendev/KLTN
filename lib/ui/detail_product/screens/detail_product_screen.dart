import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/button_circle.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/color_item.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/plus_minus_widget.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/product_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class DetailProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const DetailProductScreen({required this.productModel});
  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  List<bool> checkList = [true, false, false];
  List<Color> colorList = [colorPrimary, Colors.red, Colors.amber];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
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
                        onHandlePressed: () {
                          AppNavigator.pop();
                        },
                        icon: PhosphorIcons.caret_left_light,
                      ),
                      Text(
                        'Detail product',
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
                ProductDetailCard(productModel: widget.productModel),
                SizedBox(height: 20.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: colorPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 5.sp),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 16.sp),
                //   child: ReadMoreText(
                //     widget.productModel.description,
                //     trimLines: 3,
                //     colorClickableText: colorPrimary,
                //     trimMode: TrimMode.Line,
                //     trimCollapsedText: 'Show more',
                //     trimExpandedText: 'Show less',
                //     style: TextStyle(
                //       color: colorGray2,
                //       fontSize: 12.sp,
                //     ),
                //     moreStyle: TextStyle(
                //       color: colorPrimary,
                //       fontSize: 12.sp,
                //       fontWeight: FontWeight.w700,
                //     ),
                //     lessStyle: TextStyle(
                //       color: colorPrimary,
                //       fontSize: 12.sp,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                SizedBox(height: 20.sp),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Color',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 12.sp),
                          Container(
                            height: 35.sp,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: checkList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    ColorItem(
                                      color: colorList[index],
                                      onTap: () {
                                        setState(() {
                                          if (!checkList[index]) {
                                            checkList[index] =
                                                !checkList[index];
                                            checkList
                                                .asMap()
                                                .forEach((i, bool) {
                                              if (i != index) {
                                                checkList[i] = false;
                                              }
                                            });
                                          }
                                        });
                                      },
                                      isCheck: checkList[index],
                                    ),
                                    SizedBox(width: 10.sp),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      PlusMinusWidget(),
                    ],
                  ),
                ),
                SizedBox(height: 20.sp),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonCircle(),
                      SizedBox(width: 15.sp),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 9.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: colorPrimary,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add to cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10.sp),
                              ButtonCircle(
                                icon: PhosphorIcons.shopping_cart_simple_bold,
                                backgroundColor: Colors.white,
                                iconColor: colorPrimary,
                                sizeIcon: 17.sp,
                                boxShadow: [],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
