part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class SaveUser extends UserEvent {
  final AccountModel accountModel;
  SaveUser({required this.accountModel});
}

class UpdateUser extends UserEvent {
  final AccountModel accountModel;
  UpdateUser({required this.accountModel});
}
