import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_with_text_and_pop_button.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_wrapper.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/data/remote_data_source/user_responsitory.dart';
import 'package:app_kltn_trunghoan/models/account_model.dart';
import 'package:app_kltn_trunghoan/models/slide_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  AccountModel? accountModel;
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetInfoUserEvent) {
      await _getInfoUser(event);
      yield _getDoneUser;
    }

    if (event is UpdateUserEvent) {
      await _updateUser(event);
      yield _getDoneUser;
    }

    if (event is ChangePasswordEvent) {
      await _changePassword(event);
    }
    if (event is CleanUserEvent) {
      accountModel = null;
      yield _getDoneUser;
    }
  }

  // Public methods
  AccountModel get getAccount => accountModel ?? UserLocal().getUser();

  //private

  GetDoneUser get _getDoneUser => GetDoneUser(accountModel: getAccount);

  Future<void> _updateUser(UpdateUserEvent event) async {
    bool isSuccess = await UserResponsitory().updateUser(
      accountModel: event.accountModel,
    );
    if (!isSuccess) {
      await dialogAnimationWrapper(
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogWithTextAndPopButton(
          title: 'Không thể cập nhật thông tin',
          bodyBefore: 'Hệ thống bị lỗi',
          bodyAlign: TextAlign.center,
        ),
      );
      AppNavigator.pop();
    } else {
      accountModel = event.accountModel;
      AppNavigator.pop();
      AppNavigator.pop();
    }
  }

  Future<void> _getInfoUser(GetInfoUserEvent event) async {
    AccountModel? _accountModel = await UserResponsitory().getInfoUser(
      idUser: event.idUser,
    );
    if (_accountModel != null) {
      accountModel = _accountModel;
      UserLocal().saveAccount(_accountModel);
    }
  }

  Future<void> _changePassword(ChangePasswordEvent event) async {
    bool isSuccess = await UserResponsitory().changePassword(
      currentPassword: event.currentPassword,
      confirmPassword: event.confirmPassword,
      newPassword: event.newPassword,
    );
    if (!isSuccess) {
      await dialogAnimationWrapper(
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogWithTextAndPopButton(
          title: 'Không thể cập nhật thông tin',
          bodyBefore: 'Hệ thống bị lỗi',
          bodyAlign: TextAlign.center,
        ),
      );
      AppNavigator.pop();
    } else {
      UserLocal().deleteAccountRemember(UserLocal().getUser().email);
      UserLocal()
          .saveAccountRemember(UserLocal().getUser().email, event.newPassword);
      await dialogAnimationWrapper(
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogWithTextAndPopButton(
          title: 'Cập nhật mật khẩu',
          bodyBefore: 'Hệ thống đã cập nhật thành công mật khẩu mới',
          bodyAlign: TextAlign.center,
        ),
      );
      AppNavigator.pop();
    }
  }
}
