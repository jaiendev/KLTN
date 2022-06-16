import 'package:app_kltn_trunghoan/bloc/cart/cart_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/category/category_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:app_kltn_trunghoan/models/category_home_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:app_kltn_trunghoan/ui/category/widgets/category_card.dart';
import 'package:app_kltn_trunghoan/ui/category/widgets/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

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
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                    Row(
                      children: [
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
                                    Visibility(
                                      visible:
                                          UserLocal().getAccessToken() != '',
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10.sp),
                                          CustomNetworkImage(
                                            urlToImage:
                                                UserLocal().getUser().photo,
                                            height: 28.sp,
                                            width: 28.sp,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              }
                            }
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
                                  ],
                                ),
                                Visibility(
                                  visible: UserLocal().getAccessToken() != '',
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10.sp),
                                      CustomNetworkImage(
                                        urlToImage: UserLocal().getUser().photo,
                                        height: 28.sp,
                                        width: 28.sp,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.sp),
              Expanded(
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is GetDoneCategory) {
                      List<CategoryHomeModel>? categories =
                          state.props[0] as List<CategoryHomeModel>?;
                      if (categories != null) {
                        return GridView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.sp, vertical: 10.sp),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.sp,
                            mainAxisSpacing: 10.sp,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              categories: categories[index],
                            );
                          },
                        );
                      }
                    }
                    return GridView.builder(
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
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return CategoryCardShimmer();
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
