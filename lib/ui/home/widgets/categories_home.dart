import 'package:app_kltn_trunghoan/common/widgets/title_and_seemore.dart';
import 'package:app_kltn_trunghoan/models/category_model.dart';
import 'package:app_kltn_trunghoan/ui/home/widgets/categories_home_card.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class CategoriesHome extends StatefulWidget {
  const CategoriesHome({Key? key}) : super(key: key);

  @override
  State<CategoriesHome> createState() => _CategoriesHomeState();
}

class _CategoriesHomeState extends State<CategoriesHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: TitleAndSeeMore(
              title: 'Categories',
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
        ],
      ),
    );
  }
}
