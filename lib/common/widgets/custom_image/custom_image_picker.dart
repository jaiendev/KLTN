import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_loading.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/photo_helper.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:extended_image/extended_image.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class CustomImagePicker {
  final _picker = ImagePicker();

  Widget _buildImageModalButton({
    required int index,
    required String icon,
    required String text,
    required ImageSource source,
    bool isRequireCrop = true,
    Function? handleFinish,
  }) {
    return TextButton(
      onPressed: () async {
        try {
          AppNavigator.pop();
          XFile? image = await getImage(
            context: AppNavigator.context,
            source: source,
          );
          if (handleFinish != null && image != null) {
            if (isRequireCrop) {
              AppNavigator.push(Routes.EDIT_PHOTO, arguments: {
                'image': File(image.path),
                'handleFinish': handleFinish,
              });
            } else {
              showDialogLoading();
              File? imageReduce = await PhotoHelper().reduceSize(image.path);
              if (imageReduce != null) {
                handleFinish(imageReduce);
                AppNavigator.pop();
              }
            }
          }
        } catch (exception) {
          print(exception);
        }
      },
      style: ButtonStyle(
          animationDuration: Duration(milliseconds: 0),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black.withOpacity(0.5);
              }
              return Colors.black; // Use the component's default.
            },
          ),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 20.sp,
            ),
            SizedBox(width: 12.sp),
            Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage({context, source = ImageSource.gallery}) async {
    return await _picker.pickImage(source: source, imageQuality: 100);
  }

  Future openImagePicker({
    required BuildContext context,
    String text = 'Tải ảnh mới',
    bool isRequireCrop = true,
    Function? handleFinish,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 210.sp,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.sp),
                    topRight: Radius.circular(24.sp),
                  ),
                  color: Colors.white,
                ),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.sp,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 6.sp,
                    ),
                    _buildImageModalButton(
                      index: 0,
                      icon: iconPhoto,
                      text: 'Chọn ảnh có sẵn',
                      source: ImageSource.gallery,
                      isRequireCrop: isRequireCrop,
                      handleFinish: handleFinish,
                    ),
                    dividerChat,
                    _buildImageModalButton(
                      index: 1,
                      icon: iconCamera,
                      text: 'Chụp ảnh mới',
                      source: ImageSource.camera,
                      isRequireCrop: isRequireCrop,
                      handleFinish: handleFinish,
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
