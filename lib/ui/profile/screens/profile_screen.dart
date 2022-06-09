import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/authenication/authenication_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_loading.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:app_kltn_trunghoan/ui/profile/widgets/button_select.dart';
import 'package:app_kltn_trunghoan/ui/profile/widgets/container_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocBuilder<AuthenicationBloc, AuthenicationState>(
            builder: (context, state) {
              if (state is AuthenticationSuccess) {
                return Container(
                  color: Colors.white,
                  height: 100.h,
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  'My Profile',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: colorPrimary,
                                  ),
                                ),
                              ),
                            ),
                            ButtonIcon(
                              onHandlePressed: () {
                                showDialogLoading();
                                AppBloc.authBloc.add(LogOutEvent());
                              },
                              icon: PhosphorIcons.sign_out_light,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: Row(
                          children: [
                            CustomNetworkImage(
                              urlToImage: UserLocal().getUser().photo,
                              height: 80.sp,
                              width: 80.sp,
                            ),
                            SizedBox(width: 15.sp),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  UserLocal().getUser().name,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: colorPrimary,
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  UserLocal().getUser().phone,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                    color: colorGray1,
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            TouchableOpacity(
                              onTap: () {
                                AppNavigator.push(Routes.EDIT_PROFILE);
                              },
                              child: Icon(
                                PhosphorIcons.pencil_simple_line_light,
                                color: colorGray1,
                                size: 25.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      Container(
                        height: 74.sp,
                        width: 100.w,
                        margin: EdgeInsets.symmetric(horizontal: 16.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.sp),
                          border: Border.all(width: 1.sp, color: colorPrimary),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 4.sp,
                              color: Colors.black.withOpacity(.08),
                            ),
                          ],
                        ),
                        child: ContainerOrder(),
                      ),
                      SizedBox(height: 15.sp),
                      dividerThinkness6NotMargin,
                      ButtonSelect(
                        content: 'Personal infomation',
                        icon: PhosphorIcons.user_light,
                        handlePressed: () {
                          AppNavigator.push(Routes.EDIT_PROFILE);
                        },
                      ),
                      dividerChat,
                      ButtonSelect(
                        content: 'Change password',
                        icon: PhosphorIcons.lock_key_light,
                        handlePressed: () {
                          AppNavigator.push(Routes.CHANGE_PASSWORD);
                        },
                      ),
                      dividerChat,
                      ButtonSelect(
                        content: 'Favorite product',
                        icon: PhosphorIcons.heart_straight_light,
                        handlePressed: () {
                          AppNavigator.push(Routes.FAVORITE_PRODUCT);
                        },
                      ),
                      dividerChat,
                      ButtonSelect(
                        content: 'Language',
                        icon: PhosphorIcons.globe_light,
                        handlePressed: () {},
                      ),
                    ],
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
