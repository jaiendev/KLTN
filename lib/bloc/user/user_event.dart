part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetInfoUserEvent extends UserEvent {
  final String idUser;
  GetInfoUserEvent({required this.idUser});
}

class UpdateUserEvent extends UserEvent {
  final AccountModel accountModel;
  UpdateUserEvent({required this.accountModel});
}

class ChangePasswordEvent extends UserEvent {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;
  ChangePasswordEvent({
    required this.confirmPassword,
    required this.currentPassword,
    required this.newPassword,
  });
}

class CleanUserEvent extends UserEvent {}
