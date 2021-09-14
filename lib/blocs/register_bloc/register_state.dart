part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class SignUpSuccess extends RegisterState {}

class SignUpFailure extends RegisterState {
  final String? msg;
  SignUpFailure({this.msg});
}

class Loading extends RegisterState {}
