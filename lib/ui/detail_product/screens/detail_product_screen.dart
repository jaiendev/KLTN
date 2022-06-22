import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/cart/cart_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/product/product_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/rating/rating_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_confirm_cancel.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_with_text_and_pop_button.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_wrapper.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:app_kltn_trunghoan/models/rating_model.dart';
import 'package:app_kltn_trunghoan/models/slide_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/button_circle.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/color_item.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/plus_minus_widget.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/product_detail_card.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/rating_text_review.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/review_card.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class DetailProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const DetailProductScreen({required this.productModel});
  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  List<bool> checkList = [true, false, false];
  List<Color> colorList = [colorPrimary, Colors.red, Colors.amber];
  bool isCheckHeart = false;
  int qty = 1;
  @override
  void initState() {
    super.initState();
  }

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
        child: Column(
          children: [
            Expanded(
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
                            BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                if (state is GetDoneCartUser) {
                                  List<CartModel>? carts =
                                      state.props[0] as List<CartModel>?;

                                  if (carts != null && carts.isNotEmpty) {
                                    return Row(
                                      children: [
                                        Stack(
                                          children: [
                                            ButtonIcon(
                                              onHandlePressed: () {
                                                AppNavigator.push(Routes.CART);
                                              },
                                              icon: PhosphorIcons
                                                  .shopping_cart_simple_light,
                                            ),
                                            Positioned(
                                              right: 5,
                                              top: 2,
                                              child: Visibility(
                                                visible: (carts.length) != 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: colorPrimary,
                                                  ),
                                                  padding: EdgeInsets.all(4.sp),
                                                  child: Text(
                                                    '${carts.length}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    );
                                  }
                                }
                                return SizedBox();
                              },
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
                          'Giới thiệu: ',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Html(
                        data: '${widget.productModel.description}',
                        tagsList: Html.tags..addAll(["bird", "flutter"]),
                        style: {},
                      ),
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
                            PlusMinusWidget(
                              count: qty,
                              onTapAdd: () {
                                setState(() {
                                  qty++;
                                });
                              },
                              onTapSub: () {
                                setState(() {
                                  if (qty > 1) {
                                    qty--;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: Text(
                          'Nhận xét: ',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      BlocBuilder<RatingBloc, RatingState>(
                        builder: (context, state) {
                          if (state is GetDoneRating) {
                            Map<String, List<RatingModel>>? listRating = state
                                .props[0] as Map<String, List<RatingModel>>?;
                            return listRating?[widget.productModel.id] != null
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.sp),
                                        child: RatingAndTextReview(
                                          ratingCount: listRating?[
                                                      widget.productModel.id]!
                                                  .length ??
                                              0,
                                          stars: widget
                                              .productModel.ratingAverage
                                              .round(),
                                        ),
                                      ),
                                      SizedBox(height: 18.sp),
                                      ListView.builder(
                                        padding: EdgeInsets.only(left: 16.sp),
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            listRating?[widget.productModel.id]
                                                    ?.length ??
                                                0,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return ReviewCard(
                                            productId: widget.productModel.id,
                                            ratingModel: listRating![
                                                widget.productModel.id]![index],
                                            isCheckLastReview: index ==
                                                (listRating[widget
                                                            .productModel.id]!
                                                        .length -
                                                    1),
                                          );
                                        },
                                      ),
                                      Visibility(
                                        visible: UserLocal().getAccessToken() !=
                                                '' &&
                                            listRating?[widget.productModel.id]!
                                                    .indexWhere((rating) =>
                                                        rating.user ==
                                                        UserLocal()
                                                            .getUser()
                                                            .id) ==
                                                -1,
                                        child: TouchableOpacity(
                                          onTap: () {
                                            AppNavigator.push(
                                                Routes.CREATE_RATING,
                                                arguments: {
                                                  'productId':
                                                      widget.productModel.id,
                                                });
                                          },
                                          child: Container(
                                            width: 100.w,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16.sp),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 9.sp),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.sp),
                                              border: Border.all(
                                                  width: 1.sp,
                                                  color: colorPrimary),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Viết nhận xét',
                                              style: TextStyle(
                                                color: colorPrimary,
                                                fontSize: 13.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Container();
                          }
                          return Container();
                        },
                      ),
                      SizedBox(height: 18.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: Text(
                          'Sản phẩm cùng loại: ',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.sp),
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (state is GetDoneProductCategoryHome) {
                            Map<String, List<ProductModel>>? products = state
                                .props[0] as Map<String, List<ProductModel>>?;
                            if (products?[widget.productModel.category] !=
                                    null &&
                                products![widget.productModel.category]!
                                    .isNotEmpty) {
                              products[widget.productModel.category!] =
                                  products[widget.productModel.category]!
                                      .where(
                                        (element) =>
                                            element.id !=
                                            widget.productModel.id,
                                      )
                                      .toList();

                              return Container(
                                height: 35.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.only(left: 16.sp),
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      products[widget.productModel.category]
                                              ?.length ??
                                          0,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 10.sp),
                                      width: 50.w,
                                      child: ProductCard(
                                        productModel: products[widget
                                            .productModel.category]![index],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          }
                          return SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonCircle(
                    isCheck: isCheckHeart,
                    onTap: (val) {
                      setState(() {
                        isCheckHeart = !isCheckHeart;
                      });
                    },
                  ),
                  SizedBox(width: 15.sp),
                  Expanded(
                    child: TouchableOpacity(
                      onTap: () async {
                        if (UserLocal().getAccessToken() != '') {
                          await dialogAnimationWrapper(
                            borderRadius: 10.sp,
                            slideFrom: SlideMode.bot,
                            child: DialogConfirmCancel(
                              title: 'Thêm sản phẩm vào giỏ hàng',
                              bodyBefore:
                                  'Sản phẩm này sẽ được thêm vào giỏ hàng?',
                              confirmText: 'Đồng ý',
                              cancelText: 'Hủy',
                              onConfirmed: () async {
                                AppBloc.cartBloc.add(
                                  AddProductCartEvent(
                                    productId: widget.productModel.id,
                                    qty: qty,
                                    price: widget.productModel.price.round(),
                                    productName: widget.productModel.name,
                                    productImage:
                                        widget.productModel.productPicture ??
                                            '',
                                  ),
                                );
                                AppNavigator.pop();
                              },
                            ),
                          );
                        } else {
                          await dialogAnimationWrapper(
                            borderRadius: 10.sp,
                            slideFrom: SlideMode.bot,
                            child: DialogWithTextAndPopButton(
                              title: 'Đăng nhập để thêm giỏ hàng',
                              bodyAfter:
                                  'Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng!',
                            ),
                          );
                          AppNavigator.push(Routes.STARTED);
                        }
                      },
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
                              isCheck: false,
                              onTap: (bool) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.sp),
          ],
        ),
      ),
    );
  }
}
