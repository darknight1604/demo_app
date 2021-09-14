part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequest extends RegisterEvent {
  final String username;
  final String password;

  SignUpRequest({
    required this.username,
    required this.password,
  });
}
