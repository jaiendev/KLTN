import 'package:app_kltn_trunghoan/common/widgets/empty.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/purchase_model.dart';
import 'package:app_kltn_trunghoan/ui/my_purchases/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class PurchasesScreen extends StatefulWidget {
  final int tabNumber;
  final List<PurchaseModel> orderModel;
  // final ServiceManagamentState currentState;
  PurchasesScreen({
    Key? key,
    required this.tabNumber,
    required this.orderModel,
    // required this.currentState,
  }) : super(key: key);

  @override
  _PurchasesScreenState createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.orderModel.isEmpty
        ? Empty(
            image: Image.asset(
              iconBox,
              width: 140.sp,
              height: 82.sp,
            ),
            text: 'Chưa có đơn hàng nào',
          )
        : ListView.builder(
            padding: EdgeInsets.only(bottom: 10.h),
            itemCount: widget.orderModel.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return OrderCard(
                orderModel: widget.orderModel[index],
                status: widget.tabNumber,
              );
            },
          );
  }
}
