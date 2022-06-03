// import 'package:app_kltn_trunghoan/common/pagination_list_view.dart';
// import 'package:app_kltn_trunghoan/common/widgets/empty.dart';
// import 'package:app_kltn_trunghoan/constants/constants.dart';
// import 'package:app_kltn_trunghoan/models/order_model.dart';
// import 'package:app_kltn_trunghoan/ui/my_purchases/widgets/order_card.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class PurchasesScreen extends StatefulWidget {
//   final int tabNumber;
//   final List<OrderModel> orderModel;
//   // final ServiceManagamentState currentState;
//   PurchasesScreen({
//     Key? key,
//     required this.tabNumber,
//     required this.orderModel,
//     // required this.currentState,
//   }) : super(key: key);

//   @override
//   _PurchasesScreenState createState() => _PurchasesScreenState();
// }

// class _PurchasesScreenState extends State<PurchasesScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.orderModel.isEmpty
//         ? Empty(
//             image: Image.asset(
//               iconBox,
//               width: 140.sp,
//               height: 82.sp,
//             ),
//             text: 'No Order Yet',
//           )
//         : PaginationListView(
//             padding: EdgeInsets.only(bottom: 10.h),
//             // isLoadMore: widget.currentState is GettingService,
//             itemCount: widget.orderModel.length,
//             itemBuilder: (context, index) {
//               return OrderCard(
//                 orderModel: widget.orderModel[index],
//               );
//             },
//             // callBackLoadMore: () {
//             //   // AppBloc.serviceManagamentBloc.add(GetServiceEvent());
//             // },
//             callBackLoadMore: null,
//             callBackRefresh: (Function handleFinished) {
//               // AppBloc.serviceManagamentBloc.add(
//               //   RefreshServiceEvent(
//               //     handleFinished: handleFinished,
//               //   ),
//               // );
//             },
//             childShimmer: Container(),
//           );
//   }
// }
