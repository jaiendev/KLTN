import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/cart/cart_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/home/home_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/product/product_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/common/widgets/search_box.dart';
import 'package:app_kltn_trunghoan/common/widgets/title_and_seemore.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:app_kltn_trunghoan/models/category_model.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/categories_home_card.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/product_card.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/product_card_shimmer.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/product_recommend_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String nameProductHot = 'Màn hình';
  String idCategory = '';
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    idCategory = '61a8a5c663bfc4c3df6b3c3c';
    listCategories[0].isCheck = true;
    listCategories.asMap().forEach(
      (i, bool) {
        if (i != 0) {
          listCategories[i].isCheck = false;
        }
      },
    );
  }

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
        child: SmartRefresher(
          physics: BouncingScrollPhysics(),
          scrollController: _scrollController,
          controller: _refreshController,
          enablePullUp: false,
          enablePullDown: true,
          header: MaterialClassicHeader(
            offset: 0,
            height: 44.sp,
            distance: 20.sp,
            backgroundColor: colorPrimary,
            color: Colors.white,
          ),
          onRefresh: () async {
            AppBloc.homeBloc.add(
              RefreshHomeEvent(
                handleFinished: () => _refreshController.refreshCompleted(),
              ),
            );
          },
          onLoading: () => null,
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
                                              UserLocal().getAccessToken() !=
                                                  '',
                                          child: TouchableOpacity(
                                            onTap: () {
                                              AppBloc.homeBloc.add(
                                                OnChangeIndexEvent(
                                                  index: 3,
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                SizedBox(width: 10.sp),
                                                CustomNetworkImage(
                                                  urlToImage: UserLocal()
                                                      .getUser()
                                                      .photo,
                                                  height: 28.sp,
                                                  width: 28.sp,
                                                ),
                                              ],
                                            ),
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
                                      visible:
                                          UserLocal().getAccessToken() != '',
                                      child: TouchableOpacity(
                                        onTap: () {
                                          AppBloc.homeBloc.add(
                                            OnChangeIndexEvent(
                                              index: 3,
                                            ),
                                          );
                                        },
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Text(
                      'Phụ kiện công nghệ\ntốt nhất Việt Nam.',
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
                  SizedBox(height: 10.sp),
                  ProductRecommendList(),
                  SizedBox(height: 20.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: TitleAndSeeMore(
                      title: 'Danh mục',
                      checkSeeMore: false,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Container(
                    height: 35.sp,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      itemCount: listCategories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoriesHomeCard(
                          icon: listCategories[index].icon,
                          title: listCategories[index].title,
                          isCheck: listCategories[index].isCheck,
                          onHandlePressed: () {
                            setState(
                              () {
                                if (!listCategories[index].isCheck) {
                                  listCategories[index].isCheck =
                                      !listCategories[index].isCheck;
                                  nameProductHot = listCategories[index].title;
                                  AppBloc.productBloc.add(
                                    OnProductCategoryHomeEvent(
                                        idCategory: listCategories[index].id),
                                  );
                                  idCategory = listCategories[index].id;
                                  listCategories.asMap().forEach(
                                    (i, bool) {
                                      if (i != index) {
                                        listCategories[i].isCheck = false;
                                      }
                                    },
                                  );
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: TitleAndSeeMore(
                      title: '${nameProductHot} nổi bật',
                      checkSeeMore: true,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is GetDoneProductCategoryHome) {
                        Map<String, List<ProductModel>>? products =
                            state.props[0] as Map<String, List<ProductModel>>?;
                        if (products?[idCategory] != null) {
                          return GridView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.sp, vertical: 18.sp),
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.sp,
                              mainAxisSpacing: 10.sp,
                              childAspectRatio: 3 / 5,
                            ),
                            itemCount: products?[idCategory]?.length ?? 0,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                productModel: products![idCategory]![index],
                              );
                            },
                          );
                        }
                      }
                      return GridView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.sp, vertical: 18.sp),
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.sp,
                          mainAxisSpacing: 10.sp,
                          childAspectRatio: 3 / 5,
                        ),
                        itemCount: 6,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ProductCardShimmer();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
