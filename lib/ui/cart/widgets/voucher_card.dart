import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

// ignore: must_be_immutable
class VoucherCard extends StatefulWidget {
  final Color color;
  final String discountPercent;
  final String describe;
  final String code;
  final Function(bool) onTap;
  bool isActive;
  VoucherCard({
    Key? key,
    required this.color,
    required this.discountPercent,
    required this.describe,
    required this.code,
    required this.onTap,
    this.isActive = true,
  }) : super(key: key);

  @override
  State<VoucherCard> createState() => _VoucherCardState();
}

class _VoucherCardState extends State<VoucherCard>
    with AutomaticKeepAliveClientMixin {
  bool isCheck = false;
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TouchableOpacity(
      onTap: () {
        if (widget.isActive) {
          isCheck = !isCheck;
          widget.onTap(isCheck);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.075),
              offset: Offset(-1, -1),
              blurRadius: 1,
            ),
            BoxShadow(
              color: Colors.grey,
              offset: Offset(3, 3),
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  padding: EdgeInsets.all(20.sp),
                  child: Text(
                    '-${widget.discountPercent}%',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Positioned(
                  top: 8.sp,
                  left: -5.sp,
                  child: Container(
                    height: 60.sp,
                    width: 10.sp,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 15.sp,
                          height: 15.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                            border: isCheck
                                ? Border.all(color: widget.color)
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 8.sp,
                  right: -5.sp,
                  child: Container(
                    height: 60.sp,
                    width: 10.sp,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 15.sp,
                          height: 15.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 8.sp,
            ),
            Container(
              width: 55.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.sp),
                  Text(
                    widget.describe,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: colorPrimary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Ngày sử dụng: 20.09.2022 - 30.09.2022 ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: colorPrimary,
                      fontSize: 10.sp,
                    ),
                  ),
                  Text(
                    'Mã code: ${widget.code}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: colorPrimary,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.sp),
            Container(
              margin: EdgeInsets.only(right: 10.sp),
              padding: EdgeInsets.all(5.sp),
              height: 20.sp,
              width: 20.sp,
              decoration: BoxDecoration(
                color: isCheck ? widget.color : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: widget.color),
              ),
              child: Image.asset(
                iconCheck,
                height: 15.sp,
                width: 15.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
