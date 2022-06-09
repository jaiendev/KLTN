part of 'authenication_bloc.dart';

@immutable
abstract class AuthenicationState {}

class AuthenicationInitial extends AuthenicationState {}

class AuthenticationSuccess extends AuthenicationState {}

class AuthenticationFail extends AuthenicationState {}

class Authenticating extends AuthenicationState {}
