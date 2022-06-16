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

  AccountModel accountModel = UserLocal().getUser();
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is SaveUser) {
      accountModel = event.accountModel;
      yield _getDoneUser;
    }

    if (event is UpdateUser) {
      await _updateUser(event);
      yield _getDoneUser;
    }
  }

  //private

  GetDoneUser get _getDoneUser => GetDoneUser(accountModel: accountModel);

  Future<void> _updateUser(UpdateUser event) async {
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
    }
  }
}
