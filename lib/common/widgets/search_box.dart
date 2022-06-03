import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class SearchBox extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  SearchBox({this.margin});

  @override
  State<StatefulWidget> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController searchKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.sp,
      width: 73.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: colorWhite1,
      ),
      padding: EdgeInsets.zero,
      child: TextFormField(
        controller: searchKey,
        style: TextStyle(
          color: colorBlack2,
          fontSize: 12.sp,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 0.sp,
            right: 10.sp,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: colorHintSearch,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          focusColor: colorPrimary,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Container(
            child: Icon(
              PhosphorIcons.magnifying_glass_light,
              color: colorHintSearch,
              size: 15.sp,
            ),
          ),
          suffixIcon: searchKey.text.isEmpty
              ? SizedBox()
              : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    PhosphorIcons.x_circle_light,
                    color: colorHintSearch,
                  ),
                ),
        ),
      ),
    );
  }
}
