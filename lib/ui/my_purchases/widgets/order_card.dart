import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/purchase_model.dart';
import 'package:app_kltn_trunghoan/ui/my_purchases/widgets/product_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final PurchaseModel orderModel;
  final int status;
  OrderCard({required this.orderModel, required this.status});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.sp, horizontal: 4.sp),
                      decoration: BoxDecoration(
                        color: colorPrimary,
                      ),
                      child: Text(
                        'Yêu thích',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.sp),
                    Container(
                      width: 45.w,
                      child: Text(
                        '${orderModel.name}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: colorPrimary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      getStatus(status),
                      style: TextStyle(
                        color: colorPrimary,
                        fontSize: 12.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.sp),
                ListView.builder(
                  itemCount: orderModel.items.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProductOrderCard(
                      cartModel: orderModel.items[index],
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
                child: Text(
                  'Tổng tiền: ${orderModel.costString}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colorPrimary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          dividerChat,
          SizedBox(height: 7.sp),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  PhosphorIcons.truck_light,
                  size: 17.sp,
                  color: Colors.green,
                ),
                SizedBox(width: 5.sp),
                Text(
                  getStatusShipping(status),
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 9.sp,
                  ),
                ),
                Spacer(),
                Icon(
                  PhosphorIcons.caret_right_light,
                  size: 12.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 7.sp),
          dividerChat,
          SizedBox(height: 7.sp),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ngày xác nhận đơn hàng ${DateFormat("dd/MM/yyyy").format(orderModel.date)}',
                  style: TextStyle(
                    color: colorGray2,
                    fontSize: 9.sp,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 6.sp),
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.circular(3.sp),
                  ),
                  child: Text(
                    'Xem đơn hàng',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.sp),
          dividerThinkness6NotMargin,
        ],
      ),
    );
  }

  String getStatus(int status) {
    switch (status) {
      case 0:
        return 'Chờ xác nhận';
      case 1:
        return 'Đang giao';
      case 2:
        return 'Đã giao';
      default:
        return 'Chờ xác nhận';
    }
  }

  String getStatusShipping(int status) {
    switch (status) {
      case 0:
        return 'Shop đang kiểm tra hàng';
      case 1:
        return 'Đang vận chuyển';
      case 2:
        return 'Giao hàng thành công';
      default:
        return 'Shop đang kiểm tra hàng';
    }
  }
}
