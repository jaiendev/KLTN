import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class BottomSheetCategory extends StatefulWidget {
  final Function(String) handlePressed;
  final String? category;
  final List<String> categories;
  BottomSheetCategory({
    required this.handlePressed,
    required this.category,
    required this.categories,
  });

  @override
  State<BottomSheetCategory> createState() => _BottomSheetCategoryState();
}

class _BottomSheetCategoryState extends State<BottomSheetCategory> {
  late String? _category;
  @override
  void initState() {
    super.initState();
    _category = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80.h,
        child: Column(
          children: [
            SizedBox(
              height: 6.sp,
            ),
            Container(
              width: 60.sp,
              height: 3.sp,
              decoration: BoxDecoration(
                color: colorGray4,
                borderRadius: BorderRadius.circular(1.5.sp),
              ),
            ),
            SizedBox(
              height: 21.sp,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              alignment: Alignment.centerLeft,
              height: 24.sp,
              child: Text(
                'Chọn danh mục cần tìm',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: colorBlack2,
                ),
              ),
            ),
            SizedBox(height: 12.sp),
            Divider(
              color: colorGray2,
              thickness: 0.5.sp,
            ),
            SizedBox(height: 12.sp),
            Expanded(
              child: RawScrollbar(
                isAlwaysShown: true,
                thumbColor: Colors.white,
                radius: Radius.circular(30.sp),
                thickness: 4.sp,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: widget.categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: widget.categories[index] == _category
                          ? colorBlue
                          : Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 12.sp),
                      child: TouchableOpacity(
                        onTap: () {
                          if (widget.categories[index] != _category) {
                            widget.handlePressed(widget.categories[index]);
                            setState(() {
                              _category = widget.categories[index];
                            });
                          }
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16.sp,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  widget.categories[index],
                                  style: widget.categories[index] == _category
                                      ? TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: colorBlue2,
                                        )
                                      : TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: colorBlack,
                                        ),
                                ),
                              ),
                            ),
                            Container(
                              width: 64.sp,
                              child: Center(
                                child: widget.categories[index] == _category
                                    ? Icon(
                                        PhosphorIcons.check_light,
                                        color: colorBlue2,
                                        size: 14.58.sp,
                                      )
                                    : null,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 12.sp),
          ],
        ),
      ),
    );
  }
}
