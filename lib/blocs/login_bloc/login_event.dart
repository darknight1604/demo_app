part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequest extends LoginEvent {
  final String username;
  final String password;

  LoginRequest({
    required this.username,
    required this.password,
  });
}
