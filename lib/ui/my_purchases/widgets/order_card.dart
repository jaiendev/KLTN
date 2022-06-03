// import 'package:app_kltn_trunghoan/constants/constants.dart';
// import 'package:app_kltn_trunghoan/models/order_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
// import 'package:sizer/sizer.dart';

// class OrderCard extends StatelessWidget {
//   final OrderModel orderModel;
//   OrderCard({required this.orderModel});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(height: 10.sp),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.sp),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                           vertical: 2.sp, horizontal: 4.sp),
//                       decoration: BoxDecoration(
//                         color: colorPrimary,
//                       ),
//                       child: Text(
//                         'Yêu thích',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 5.sp),
//                     Container(
//                       width: 45.w,
//                       child: Text(
//                         orderModel.productModel.type,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           color: colorPrimary,
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       'To Receive',
//                       style: TextStyle(
//                         color: colorPrimary,
//                         fontSize: 12.sp,
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 8.sp),
//                 Container(
//                   child: Row(
//                     children: [
//                       Container(
//                         // decoration:
//                         //     AppDecoration.buttonActionBorder(context, 4.sp).decoration,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.075),
//                               offset: Offset(-1, -1),
//                               blurRadius: 1,
//                             ),
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: Offset(3, 3),
//                               blurRadius: 2,
//                             ),
//                           ],
//                         ),
//                         padding: EdgeInsets.all(10.sp),
//                         child: Image.asset(
//                           productFake,
//                           height: 22.sp,
//                           width: 22.sp,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(width: 8.sp),
//                       Container(
//                         width: 60.w,
//                         child: Text(
//                           orderModel.productModel.title,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: colorPrimary,
//                             fontSize: 12.sp,
//                           ),
//                         ),
//                       ),
//                       Spacer(),
//                       Text(
//                         'x1',
//                         style: TextStyle(
//                           color: colorPrimary,
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: '\$350',
//                             style: TextStyle(
//                               decoration: TextDecoration.lineThrough,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 11.sp,
//                               color: colorHintSearch,
//                             ),
//                           ),
//                           TextSpan(
//                             text: '  \$250',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 11.sp,
//                               color: Colors.redAccent,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10.sp),
//           dividerChat,
//           SizedBox(height: 7.sp),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16.sp),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(
//                   PhosphorIcons.truck_light,
//                   size: 17.sp,
//                   color: Colors.green,
//                 ),
//                 SizedBox(width: 5.sp),
//                 Text(
//                   'Giao hàng thành công',
//                   style: TextStyle(
//                     color: Colors.green,
//                     fontSize: 9.sp,
//                   ),
//                 ),
//                 Spacer(),
//                 Icon(
//                   PhosphorIcons.caret_right_light,
//                   size: 12.sp,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 7.sp),
//           dividerChat,
//           SizedBox(height: 7.sp),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16.sp),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Confirm receipt of products by 26-05-2022',
//                   style: TextStyle(
//                     color: colorGray2,
//                     fontSize: 9.sp,
//                   ),
//                 ),
//                 Container(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 10.sp, vertical: 6.sp),
//                   decoration: BoxDecoration(
//                     color: colorPrimary,
//                     borderRadius: BorderRadius.circular(3.sp),
//                   ),
//                   child: Text(
//                     'Order Received',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 10.sp,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(height: 10.sp),
//           dividerThinkness6NotMargin,
//         ],
//       ),
//     );
//   }
// }
