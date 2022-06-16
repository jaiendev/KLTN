import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/product/product_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/category_home_model.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/ui/filter_product/widgets/bottom_sheet_category.dart';
import 'package:app_kltn_trunghoan/ui/filter_product/widgets/trademark_card.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/product_card.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/product_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class FilterProductScreen extends StatefulWidget {
  final CategoryHomeModel categoryHomeModel;

  const FilterProductScreen({required this.categoryHomeModel});
  @override
  State<FilterProductScreen> createState() => _FilterProductScreenState();
}

class _FilterProductScreenState extends State<FilterProductScreen> {
  List<String> categories = [];
  String _category = '';
  TextEditingController _categoryController = TextEditingController();
  CategoryHomeModel? _categoryHomeModel;
  String idCategory = '';
  @override
  void initState() {
    super.initState();
    _categoryHomeModel = widget.categoryHomeModel;
    _category = widget.categoryHomeModel.name;
    _categoryController.text = _category;
    categories = AppBloc.categoryBloc.categories.map((e) => e.name).toList();
    _categoryHomeModel!.children![0].isCheck = true;
    AppBloc.productBloc.add(OnProductCategoryHomeEvent(
        idCategory: _categoryHomeModel!.children![0].id));
    idCategory = _categoryHomeModel!.children![0].id;
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
                      'Lọc sản phẩm',
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
                      'Danh mục: ',
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
                          child: TextFieldForm(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.sp),
                                  ),
                                ),
                                builder: (context) => BottomSheetCategory(
                                  handlePressed: (val) {
                                    // AppBloc.suggestionBloc.add(
                                    //   new GetSuggestionEvent(
                                    //       fieldId:
                                    //           _findSpecialtySlectedId(val)),
                                    // );

                                    _category = val;
                                    int indexOf = AppBloc
                                        .categoryBloc.categories
                                        .indexWhere(
                                            (element) => element.name == val);

                                    setState(() {
                                      _categoryController.text = _category;
                                      _categoryHomeModel = AppBloc
                                          .categoryBloc.categories[indexOf];
                                      _categoryHomeModel!.children![0].isCheck =
                                          true;
                                      AppBloc.productBloc.add(
                                        OnProductCategoryHomeEvent(
                                          idCategory: _categoryHomeModel!
                                              .children![0].id,
                                        ),
                                      );
                                      idCategory =
                                          _categoryHomeModel!.children![0].id;
                                    });
                                  },
                                  categories: categories,
                                  category: _category,
                                ),
                              );
                            },
                            controller: _categoryController,
                            isActive: true,
                            readOnly: true,
                            suffixIcon: Container(
                              color: Colors.transparent,
                              child: Icon(
                                PhosphorIcons.caret_down_light,
                                size: 15.sp,
                              ),
                            ),
                            validatorForm: (val) => null,
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
                        'Nhãn hàng: ',
                        style: TextStyle(
                          color: colorPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    (_categoryHomeModel!.children != null &&
                            _categoryHomeModel!.children!.isNotEmpty)
                        ? Container(
                            height: 35.sp,
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 16.sp),
                              itemCount: _categoryHomeModel!.children!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return TrademarkCard(
                                  title:
                                      _categoryHomeModel!.children![index].name,
                                  isCheck: _categoryHomeModel!
                                      .children![index].isCheck,
                                  onHandlePressed: () {
                                    setState(() {
                                      if (!_categoryHomeModel!
                                          .children![index].isCheck) {
                                        _categoryHomeModel!
                                                .children![index].isCheck =
                                            !_categoryHomeModel!
                                                .children![index].isCheck;
                                        AppBloc.productBloc.add(
                                          OnProductCategoryHomeEvent(
                                            idCategory: _categoryHomeModel!
                                                .children![index].id,
                                          ),
                                        );
                                        idCategory = _categoryHomeModel!
                                            .children![index].id;
                                        _categoryHomeModel!.children!
                                            .asMap()
                                            .forEach((i, bool) {
                                          if (i != index) {
                                            _categoryHomeModel!
                                                .children![i].isCheck = false;
                                          }
                                        });
                                      }
                                    });
                                  },
                                );
                              },
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(height: 12.sp),
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is GetDoneProductCategoryHome) {
                      Map<String, List<ProductModel>>? products =
                          state.props[0] as Map<String, List<ProductModel>>?;
                      if (products?[idCategory] != null) {
                        return GridView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.sp, vertical: 18.sp),
                          physics: BouncingScrollPhysics(),
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
                      } else {
                        return Container(
                          child: Text('Không có sản phẩm'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
