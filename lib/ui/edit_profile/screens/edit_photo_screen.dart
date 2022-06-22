import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_loading.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/photo_helper.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CircleEditorCropLayerPainter extends EditorCropLayerPainter {
  const CircleEditorCropLayerPainter();

  @override
  void paintCorners(
      Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    // do nothing
  }

  @override
  void paintMask(
      Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    final Rect rect = Offset.zero & size;
    final Rect cropRect = painter.cropRect;
    final Color maskColor = painter.maskColor;
    canvas.saveLayer(rect, Paint());
    canvas.drawRect(
        rect,
        Paint()
          ..style = PaintingStyle.fill
          ..color = maskColor);
    canvas.drawCircle(cropRect.center, cropRect.width / 2.0,
        Paint()..blendMode = BlendMode.clear);
    canvas.restore();
  }

  @override
  void paintLines(
      Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    final Rect cropRect = painter.cropRect;
    if (painter.pointerDown) {
      canvas.save();
      canvas.clipPath(Path()..addOval(cropRect));
      super.paintLines(canvas, size, painter);
      canvas.restore();
    }
  }
}

class CustomCropLayerPainter extends EditorCropLayerPainter {
  const CustomCropLayerPainter();
  void paint(Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    paintMask(canvas, size, painter);
    paintLines(canvas, size, painter);
    paintCorners(canvas, size, painter);
  }

  /// draw crop layer corners
  void paintCorners(
      Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    final Rect cropRect = painter.cropRect;
    final Paint paint = Paint()
      ..color = painter.cornerColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(cropRect.left, cropRect.top), 6.5.sp, paint);
    canvas.drawCircle(Offset(cropRect.right, cropRect.top), 6.5.sp, paint);
    canvas.drawCircle(Offset(cropRect.left, cropRect.bottom), 6.5.sp, paint);
    canvas.drawCircle(Offset(cropRect.right, cropRect.bottom), 6.5.sp, paint);
  }

  /// draw crop layer lines
  void paintMask(
      Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    final Rect rect = Offset.zero & size;
    final Rect cropRect = painter.cropRect;
    final Color maskColor = painter.maskColor;

    //left
    canvas.drawRect(
        Offset.zero & Size(cropRect.left, rect.height),
        Paint()
          ..style = PaintingStyle.fill
          ..color = maskColor);
    //top
    canvas.drawRect(
        Offset(cropRect.left, 0.0) & Size(cropRect.width, cropRect.top),
        Paint()
          ..style = PaintingStyle.fill
          ..color = maskColor);
    //right
    canvas.drawRect(
        Offset(cropRect.right, 0.0) &
            Size(rect.width - cropRect.right, rect.height),
        Paint()
          ..style = PaintingStyle.fill
          ..color = maskColor);
    //bottom
    canvas.drawRect(
        Offset(cropRect.left, cropRect.bottom) &
            Size(cropRect.width, rect.height - cropRect.bottom),
        Paint()
          ..style = PaintingStyle.fill
          ..color = maskColor);
  }

  /// draw crop layer lines
  void paintLines(
      Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    final Color lineColor = painter.lineColor;
    final double lineHeight = painter.lineHeight;
    final Rect cropRect = painter.cropRect;
    final Paint linePainter = Paint()
      ..color = lineColor
      ..strokeWidth = lineHeight
      ..style = PaintingStyle.stroke;
    canvas.drawRect(cropRect, linePainter);

    canvas.drawLine(
        Offset((cropRect.right - cropRect.left) / 3.0 + cropRect.left,
            cropRect.top),
        Offset((cropRect.right - cropRect.left) / 3.0 + cropRect.left,
            cropRect.bottom),
        linePainter);

    canvas.drawLine(
        Offset((cropRect.right - cropRect.left) / 3.0 * 2.0 + cropRect.left,
            cropRect.top),
        Offset((cropRect.right - cropRect.left) / 3.0 * 2.0 + cropRect.left,
            cropRect.bottom),
        linePainter);

    canvas.drawLine(
        Offset(
          cropRect.left,
          (cropRect.bottom - cropRect.top) / 3.0 + cropRect.top,
        ),
        Offset(
          cropRect.right,
          (cropRect.bottom - cropRect.top) / 3.0 + cropRect.top,
        ),
        linePainter);

    canvas.drawLine(
        Offset(cropRect.left,
            (cropRect.bottom - cropRect.top) / 3.0 * 2.0 + cropRect.top),
        Offset(
          cropRect.right,
          (cropRect.bottom - cropRect.top) / 3.0 * 2.0 + cropRect.top,
        ),
        linePainter);
  }
}

class AspectRatioPainter extends CustomPainter {
  AspectRatioPainter({
    required this.aspectRatioS,
    this.aspectRatio,
    this.isSelected = false,
  });
  final String aspectRatioS;
  final double? aspectRatio;
  final bool isSelected;
  @override
  void paint(Canvas canvas, Size size) {
    final Color color = isSelected ? Color(0xff4E37D3) : Color(0xffffffff);
    final Rect rect = Offset.zero & size;
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        getDestinationRect(
            rect: const EdgeInsets.all(10.0).deflateRect(rect),
            inputSize: Size(200, 100.0),
            fit: BoxFit.contain),
        paint);

    final TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: aspectRatioS,
            style: TextStyle(
              color:
                  color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
              fontSize: 16.0,
            )),
        textDirection: TextDirection.ltr,
        maxLines: 1);
    textPainter.layout(maxWidth: rect.width);

    textPainter.paint(
        canvas,
        rect.center -
            Offset(textPainter.width / 2.0, textPainter.height / 2.0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate is AspectRatioPainter &&
        (oldDelegate.isSelected != isSelected ||
            oldDelegate.aspectRatioS != aspectRatioS ||
            oldDelegate.aspectRatio != aspectRatio);
  }
}

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({
    required this.aspectRatioS,
    required this.aspectRatio,
    this.isSelected = false,
  });
  final String aspectRatioS;
  final double aspectRatio;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: AspectRatioPainter(
          aspectRatio: aspectRatio,
          aspectRatioS: aspectRatioS,
          isSelected: isSelected),
    );
  }
}

class AspectRatioItem {
  AspectRatioItem({required this.value, required this.text});

  final String text;
  final double value;
}

class EditPhotoScreen extends StatefulWidget {
  final File image;
  final bool editAvatar;
  final Function(File) handleFinish;
  EditPhotoScreen({
    required this.image,
    required this.handleFinish,
    this.editAvatar = false,
  });

  @override
  _EditPhotoScreenState createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
  final GlobalKey<PopupMenuButtonState<EditorCropLayerPainter>> popupMenuKey =
      GlobalKey<PopupMenuButtonState<EditorCropLayerPainter>>();
  late EditorCropLayerPainter _cropLayerPainter;
  AspectRatioItem _aspectRatio =
      AspectRatioItem(text: '1*1', value: CropAspectRatios.ratio1_1);

  @override
  void initState() {
    _cropLayerPainter = widget.editAvatar
        ? const CircleEditorCropLayerPainter()
        : const CustomCropLayerPainter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitleBack(
        context,
        '',
        actions: [
          TouchableOpacity(
            onTap: () {
              editorKey.currentState!.reset();
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.sp),
              child: Icon(
                PhosphorIcons.recycle_light,
                size: 16.sp,
              ),
            ),
          ),
          SizedBox(width: 20.sp),
          TouchableOpacity(
            onTap: () async {
              showDialogLoading();
              File image = await PhotoHelper().cropImageDataWithDartLibrary(
                state: editorKey.currentState!,
              );
              File? imageReduce = await PhotoHelper().reduceSize(image.path);
              AppNavigator.pop();
              if (imageReduce != null) {
                widget.handleFinish(imageReduce);
                AppNavigator.pop();
              }
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              padding: EdgeInsets.only(
                right: 10.sp,
                // top: 12.sp,
              ),
              child: Text(
                'Xong',
                style: TextStyle(
                  color: colorPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: 100.h,
          padding: EdgeInsets.only(top: 12.sp, bottom: 24.sp),
          child: ExtendedImage.file(
            widget.image,
            constraints: BoxConstraints(minWidth: 100.w, minHeight: 100.h),
            fit: BoxFit.contain,
            mode: ExtendedImageMode.editor,
            enableLoadState: true,
            extendedImageEditorKey: editorKey,
            cacheRawData: true,
            initEditorConfigHandler: (state) => EditorConfig(
              editorMaskColorHandler: (context, pointerDown) =>
                  Colors.black.withOpacity(.5),
              maxScale: 8.0,
              cropRectPadding: const EdgeInsets.all(0.0),
              cropLayerPainter: _cropLayerPainter,
              initCropRectType: InitCropRectType.imageRect,
              cropAspectRatio: _aspectRatio.value,
              cornerColor: Colors.white,
              cornerSize: Size(30.0, 5.0),
              lineHeight: 0.75.sp,
            ),
          ),
        ),
      ),
    );
  }
}
