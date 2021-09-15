import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.userRepository,
  }) : super(LoginInitial());

  final UserRepository userRepository;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginRequest) {
      yield* _mapLoginRequestToState(
        event.username,
        event.password,
      );
    }
  }

  Stream<LoginState> _mapLoginRequestToState(
      String username, String password) async* {
    if (state is Loading) {
      print('busy');
    } else {
      yield Loading();
      bool result =
          await userRepository.login(username.trim(), password.trim());
      if (result) {
        yield LoginSuccess();
      } else {
        yield LoginFailure();
      }
    }
  }
}
