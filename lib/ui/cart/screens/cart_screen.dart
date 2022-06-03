import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/ui/cart/widgets/cart_card.dart';
import 'package:app_kltn_trunghoan/ui/cart/widgets/text_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                        'Shopping Bag',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: colorPrimary,
                        ),
                      ),
                      ButtonIcon(
                          onHandlePressed: () {},
                          icon: PhosphorIcons.trash_simple_light)
                    ],
                  ),
                ),
                SizedBox(height: 20.sp),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CartCard();
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.sp,
                    ),
                    color: colorPrimary,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 4.sp),
                      Expanded(
                        child: TextFieldForm(
                          margin: EdgeInsets.zero,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.sp,
                            horizontal: 11.sp,
                          ),
                          colorText: Colors.white,
                          validatorForm: null,
                          hintText: 'Promo Code',
                          colorBorder: colorPrimary,
                          backgroundColor: colorPrimary,
                          colorHintText: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                            borderSide: BorderSide(
                              color: colorPrimary,
                              width: 0.01.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.sp),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 6.sp,
                          horizontal: 18.sp,
                        ),
                        margin: EdgeInsets.only(right: 15.sp),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5.sp),
                TextTotal(title: 'Subtotal', price: 45.99),
                TextTotal(title: 'Shipping', price: 4.99),
                TextTotal(
                  title: 'Bag Total',
                  price: 50.98,
                  isCheckLast: true,
                  description: '(4 items)',
                ),
                SizedBox(height: 20.sp),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: ButtonPrimary(
                    onPressed: () {},
                    text: 'Proceed To Checkout',
                    height: 45.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
