part of 'authenication_bloc.dart';

@immutable
abstract class AuthenicationEvent {}

class OnAuthCheck extends AuthenicationEvent {}

class OnAuthProcess extends AuthenicationEvent {
  final String username;
  final String password;
  OnAuthProcess({required this.username, required this.password});
}

class RegisterEvent extends AuthenicationEvent {
  final String email;
  final String password;
  final int province;
  final String fullname;
  final String? phone;
  RegisterEvent({
    required this.email,
    required this.password,
    required this.province,
    required this.fullname,
    this.phone,
  });
}

class LoginEvent extends AuthenicationEvent {
  final bool isRemember;
  final bool isExpert;
  final String email;
  final String password;
  LoginEvent({
    required this.email,
    required this.password,
    required this.isRemember,
    required this.isExpert,
  });
}
