// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatefulWidget {
  final Widget child;

  ScaffoldWrapper({
    required this.child,
  });

  @override
  _ScaffoldWrapperState createState() => _ScaffoldWrapperState();
}

class _ScaffoldWrapperState extends State<ScaffoldWrapper> {
  _hideKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //if (!AppNavigator.canPop) {
        // await dialogAnimationWrapper(
        //   slideFrom: SlideMode.bot,
        //   child: DialogConfirmCancel(
        //     bodyBefore: 'Bạn có chắc chắn muốn thoát app?',
        //     bodyColor: colorGray1,
        //     cancelText: 'Không',
        //     confirmText: 'Có',
        //     onConfirmed: () {
        //       AppNavigator.pop();
        //       exit(0);
        //     },
        //   ),
        // );

        //   return false;
        // }
        // String descriptionDialog() {
        //   return Strings.descriptionCancelBookingExpert.i18n;
        // }

        // if (AppNavigatorObserver.currentRouteName == Routes.ORDER_EXPERT) {
        //   if (AppNavigator.canPop) {
        //     await dialogAnimationWrapper(
        //       borderRadius: 10.sp,
        //       slideFrom: SlideMode.bot,
        //       child: DialogConfirmCancel(
        //         bodyBefore: descriptionDialog(),
        //         confirmText: 'Xác nhận',
        //         cancelText: 'Hủy',
        //         onConfirmed: () async {
        //           AppNavigator.pop();
        //           AppNavigator.pop();
        //         },
        //       ),
        //     );

        //     return false;
        //   }
        // }

        // if (AppNavigatorObserver.currentRouteName == Routes.CREATE_REQUEST ||
        //     AppNavigatorObserver.currentRouteName == Routes.ADD_SKILL ||
        //     AppNavigatorObserver.currentRouteName == Routes.ADD_EXPERIENCE ||
        //     AppNavigatorObserver.currentRouteName == Routes.INFO_EXPERT ||
        //     AppNavigatorObserver.currentRouteName == Routes.EXPERT_EDIT_PRICE) {
        //   if (AppNavigator.canPop) {
        //     await dialogAnimationWrapper(
        //       child: DialogConfirmCancel(
        //         bodyBefore:
        //             'Bạn có chắc chắn muốn rời khỏi màn hình này, thông tin bạn nhập sẽ không được lưu lại?',
        //         bodyColor: colorGray1,
        //         cancelText: 'Không',
        //         confirmText: 'Có',
        //         onConfirmed: () {
        //           AppNavigator.pop();
        //           AppNavigator.pop();
        //         },
        //       ),
        //     );

        //     return false;
        //   }
        // }

        return true;
      },
      child: _child,
    );
  }

  Widget get _child {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: _getBody,
    );
  }

  Widget get _getBody {
    return GestureDetector(
      onTap: () => _hideKeyboard(),
      child: widget.child,
    );
  }
}
