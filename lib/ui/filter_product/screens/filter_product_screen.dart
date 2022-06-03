import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/trademake_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/ui/filter_product/widgets/trademark_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class FilterProductScreen extends StatefulWidget {
  FilterProductScreen({Key? key}) : super(key: key);

  @override
  State<FilterProductScreen> createState() => _FilterProductScreenState();
}

class _FilterProductScreenState extends State<FilterProductScreen> {
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
        child: Container(
          margin: EdgeInsets.only(top: 10.sp),
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
                      'Filter Product',
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
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category: ',
                      style: TextStyle(
                        color: colorPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TouchableOpacity(
                            onTap: () {},
                            child: TextFieldForm(
                              autovalidateMode: AutovalidateMode.always,
                              isActive: false,
                              initialValue: 'Screen',
                              contentPadding: EdgeInsets.fromLTRB(
                                10.sp,
                                20.sp,
                                10.sp,
                                0.sp,
                              ),
                              fontSize: 13.sp,
                              suffixIcon: TouchableOpacity(
                                onTap: () {},
                                child: Icon(
                                  PhosphorIcons.caret_down_light,
                                  size: 15.sp,
                                ),
                              ),
                              validatorForm: (val) => null,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.sp),
                          padding: EdgeInsets.all(8.9.sp),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5.sp,
                              color: colorBorderTextField,
                            ),
                            borderRadius: BorderRadius.circular(6.sp),
                          ),
                          child: Icon(
                            PhosphorIcons.sort_ascending_light,
                            size: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: Text(
                        'Trademark: ',
                        style: TextStyle(
                          color: colorPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Container(
                      height: 35.sp,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        itemCount: listTrademake.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return TrademarkCard(
                            title: listTrademake[index].title,
                            isCheck: listTrademake[index].isCheck,
                            onHandlePressed: () {
                              setState(() {
                                if (!listTrademake[index].isCheck) {
                                  listTrademake[index].isCheck =
                                      !listTrademake[index].isCheck;
                                  listTrademake.asMap().forEach((i, bool) {
                                    if (i != index) {
                                      listTrademake[i].isCheck = false;
                                    }
                                  });
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.sp),
              // Expanded(
              //   child: Container(
              //     child: GridView.builder(
              //       padding: EdgeInsets.symmetric(horizontal: 16.sp),
              //       physics: BouncingScrollPhysics(),
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         crossAxisSpacing: 12.sp,
              //         mainAxisSpacing: 10.sp,
              //         childAspectRatio: 3 / 4.4,
              //       ),
              //       itemCount: productList.length,
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) {
              //         return ProductCard(
              //           productModel: productList[index],
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
