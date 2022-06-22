import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_confirm_cancel.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_wrapper.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:app_kltn_trunghoan/models/slide_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  handleStatusPermission({
    PermissionStatus? status,
    Function? onPermissionAccepted,
    Function? onPermissionDenied,
  }) {
    switch (status) {
      case PermissionStatus.granted:
        onPermissionAccepted!();
        break;
      case PermissionStatus.permanentlyDenied:
        onPermissionDenied!();
        break;
      default:
        onPermissionDenied!();
        break;
    }
  }

  Future<bool> checkPermissionAndRequest(Permission permission) async {
    PermissionStatus status = await permission.request();
    if (status == PermissionStatus.denied) {
      status = await permission.request();
    } else if (status == PermissionStatus.permanentlyDenied) {
      dialogAnimationWrapper(
        dismissible: false,
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogConfirmCancel(
          bodyBefore: permission == Permission.camera
              ? 'Cho phép sử dụng máy ảnh để chụp và gửi ảnh hay cập nhật ảnh hồ sơ của bạn.'
              : 'Cho phép truy cập Microphone để dùng giọng nói thay văn bản nhập tay.',
          cancelText: 'Hủy',
          confirmText: 'Cài đặt',
          onConfirmed: () {
            openAppSettings();
          },
        ),
      );
    }

    return status.isGranted;
  }

  Future<void> takePhotoByCamera({
    Function? onPermissionAccepted,
    Function? onPermissionDenied,
  }) async {
    var status = await Permission.camera.status;
    handleStatusPermission(
      status: status,
      onPermissionAccepted: onPermissionAccepted!,
      onPermissionDenied: onPermissionDenied!,
    );
  }

  Future<void> choosePictureFromLibraries({
    Function? onPermissionAccepted,
    Function? onPermissionDenied,
  }) async {
    final status = await Permission.photos.status;
    handleStatusPermission(
      status: status,
      onPermissionAccepted: onPermissionAccepted!,
      onPermissionDenied: onPermissionDenied!,
    );
  }

  Future<bool> checkIsDenied(Permission permission) async {
    if (Platform.isAndroid) {
      return !(await permission.shouldShowRequestRationale);
    } else {
      var status = await permission.request();
      return status.isPermanentlyDenied;
    }
  }

  showDialogAskingForOpenSettings({
    context,
    String title = 'Camera Permission',
    String purposeString =
        'This app needs camera access to take pictures for upload user profile photo',
  }) async {
    return showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(purposeString),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('Từ chối'),
            onPressed: () => AppNavigator.pop(),
          ),
          CupertinoDialogAction(
            child: const Text('Mở Cài đặt'),
            onPressed: () {
              AppNavigator.pop();
              openAppSettings();
            },
          ),
        ],
      ),
    );
  }
}
