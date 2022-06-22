import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ContainerOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContainerOrderState();
}

class _ContainerOrderState extends State<ContainerOrder> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildSelection(
            title: 'Chờ xác nhận',
            iconData: PhosphorIcons.cardholder_light,
            onTap: () {
              AppNavigator.push(Routes.MY_PURCHASES, arguments: {
                'indexCurrent': TO_PAY,
              });
            },
          ),
        ),
        Expanded(
          child: _buildSelection(
            onTap: () {
              AppNavigator.push(Routes.MY_PURCHASES, arguments: {
                'indexCurrent': TO_SHIP,
              });
            },
            title: 'Đang giao',
            iconData: PhosphorIcons.truck_light,
          ),
        ),
        Expanded(
          child: _buildSelection(
            onTap: () {
              AppNavigator.push(Routes.MY_PURCHASES, arguments: {
                'indexCurrent': COMPLETE,
              });
            },
            title: 'Đã giao',
            iconData: PhosphorIcons.codesandbox_logo_light,
          ),
        ),
      ],
    );
  }

  Widget _buildSelection({
    required String title,
    required IconData iconData,
    required Function onTap,
  }) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 18.sp,
            ),
            SizedBox(height: 12.sp),
            Text(
              title,
              style: TextStyle(
                color: colorBlack2,
                fontSize: 11.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
