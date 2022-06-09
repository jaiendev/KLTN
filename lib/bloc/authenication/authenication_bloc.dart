import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_notify_auth.dart';

import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_with_text_and_pop_button.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_wrapper.dart';
import 'package:app_kltn_trunghoan/configs/application.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/data/remote_data_source/auth_responsitory.dart';
import 'package:app_kltn_trunghoan/models/account_model.dart';
import 'package:app_kltn_trunghoan/models/enums/authenication_fail.dart';
import 'package:app_kltn_trunghoan/models/slide_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

part 'authenication_event.dart';
part 'authenication_state.dart';

class AuthenicationBloc extends Bloc<AuthenicationEvent, AuthenicationState> {
  AuthenicationBloc() : super(AuthenicationInitial());
  final application = Application();
  @override
  Stream<AuthenicationState> mapEventToState(AuthenicationEvent event) async* {
    if (event is OnAuthCheck) {
      bool isLogin = _onAuthCheck();
      if (isLogin) {
        yield _getAuthenticationSuccess();
      } else {
        yield AuthenticationFail();
      }
    }

    if (event is LoginEvent) {
      try {
        bool isSuccess = await _handleLogin(event);

        if (isSuccess) {
          if (event.isRemember) {
            UserLocal().saveAccountRemember(event.email, event.password);
          } else {
            UserLocal().deleteAccountRemember(event.email);
          }

          AppNavigator.popUntil(Routes.HOME);

          yield _getAuthenticationSuccess();
        } else {
          yield AuthenticationFail();
        }
      } catch (exception) {
        if (exception is AuthenticationException) {
          AuthenticationException authException = exception;
          String? description = authException.description;

          AppNavigator.pop();

          UserLocal().deleteAccountRemember(event.email);

          if (description != null) {
            if (authException == AuthenticationException.WRONG_PASSWORD) {
              UserLocal().clearAccessToken();
              dialogAnimationWrapper(
                borderRadius: 10.sp,
                slideFrom: SlideMode.bot,
                child: DialogWithTextAndPopButton(
                  title: 'Login Failed',
                  bodyBefore: description,
                  bodyAlign: TextAlign.center,
                ),
              );
            }
            if (authException == AuthenticationException.DONT_VERIFY) {
              UserLocal().clearAccessToken();
              AppNavigator.popUntil(Routes.HOME);
              showGeneralDialog(
                context: AppNavigator.context!,
                barrierDismissible: false,
                barrierColor: Colors.white,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return DialogNotifyAuth(
                    email: event.email,
                    buttonTitle: 'Đã hiểu',
                    content:
                        'Vui lòng xác thực email\ntrước khi tiến hành đăng nhập!',
                    title2:
                        ' và làm theo hướng dẫn để xác thực email. (Lưu ý kiểm tra mục Spam nếu không nhận được email xác thực)',
                    title1: 'Vui lòng truy cập ',
                    image: null,
                  );
                },
              );
            }
          }
        }
      }
    }

    if (event is RegisterEvent) {
      bool isSuccess = await _handleRegister(event);
      AppNavigator.pop();
      if (isSuccess) {
        AppNavigator.popUntil(Routes.HOME);
        await showGeneralDialog(
          context: AppNavigator.context!,
          barrierDismissible: false,
          barrierColor: Colors.white,
          pageBuilder: (context, animation, secondaryAnimation) {
            return DialogNotifyAuth(
              email: event.email,
              buttonTitle: 'Hoàn thành',
              content: 'Chúc mừng bạn đã đăng ký thành công',
              title2:
                  'và làm theo hướng dẫn để xác thực email. (Lưu ý kiểm tra mục Spam nếu không nhận được email xác thực)',
              title1: 'Vui lòng truy cập ',
              image: Image.asset(
                imageRegisterSuccess,
                width: 80.sp,
                height: 80.sp,
              ),
            );
          },
        );
      } else {
        dialogAnimationWrapper(
          borderRadius: 10.sp,
          slideFrom: SlideMode.bot,
          child: DialogWithTextAndPopButton(
            title: 'Đăng kí thất bại',
            bodyAfter:
                'Email này đã được sử dụng để đăng ký tài khoản, hãy thử sử dụng email khác!',
          ),
        );
      }
    }

    if (event is LogOutEvent) {
      await _handleLogOut();
      yield AuthenticationFail();
    }
  }

  //Private methods
  AuthenticationSuccess _getAuthenticationSuccess() {
    if (state is! AuthenticationSuccess) {
      AppBloc.cleanBloc();
      AppBloc.initialHomeBloc();
    }
    return AuthenticationSuccess();
  }

  bool _onAuthCheck() {
    return UserLocal().getAccessToken() != '';
  }

  Future<bool> _handleRegister(RegisterEvent event) async {
    AccountModel? user = await AuthRepository().register(
      email: event.email,
      password: event.password,
      fullname: event.fullname,
      passwordConfirm: event.passwordConfirm,
    );

    return user != null;
  }

  Future<bool> _handleLogin(LoginEvent event) async {
    AccountModel? user = await AuthRepository().login(
      email: event.email,
      password: event.password,
    );

    AppNavigator.pop();
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _handleLogOut() async {
    UserLocal().clearAccessToken();
    AppBloc.cleanBloc();
    AppNavigator.popUntil(Routes.HOME);
  }
}
