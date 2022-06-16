import 'dart:io';

import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPaymentScreen extends StatefulWidget {
  const WebViewPaymentScreen({
    Key? key,
    required this.url,
    required this.onPaymentDone,
  }) : super(key: key);

  final String url;
  final Function(bool) onPaymentDone;

  @override
  _WebViewPaymentScreenState createState() => _WebViewPaymentScreenState();
}

class _WebViewPaymentScreenState extends State<WebViewPaymentScreen> {
  UniqueKey _key = UniqueKey();
  final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers =
      [Factory(() => EagerGestureRecognizer())].toSet();
  bool isLoadFirstSuccess = true;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: appBarTitleBack(
          context,
          'Thanh Toán',
        ),
        body: Column(
          children: [
            dividerChat,
            Expanded(
              child: Stack(
                children: [
                  WebView(
                    key: _key,
                    gestureRecognizers: _gestureRecognizers,
                    initialUrl: widget.url,
                    gestureNavigationEnabled: true,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (url) {
                      if (mounted && isLoading) {
                        setState(() {
                          isLoading = false;
                        });
                      }

                      if (url.toLowerCase().startsWith(URL_VNPAY) &&
                          isLoadFirstSuccess) {
                        isLoadFirstSuccess = false;
                        widget.onPaymentDone(true);
                      }
                    },
                  ),
                  Visibility(
                    visible: isLoading,
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      color: Colors.white,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          radius: 12.5.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
