part of 'user_bloc.dart';

@immutable
abstract class UserState {
  List get props => [];
}

class UserInitial extends UserState {
  List get props => [];
}

class GetDoneUser extends UserState {
  final AccountModel accountModel;
  GetDoneUser({required this.accountModel});

  @override
  List get props => [accountModel];
}
