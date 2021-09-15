import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required this.userRepository,
  }) : super(RegisterInitial());

  final UserRepository userRepository;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is SignUpRequest) {
      yield* _mapSignUpRequestToState(event.username, event.password);
    }
  }

  Stream<RegisterState> _mapSignUpRequestToState(
      String username, String password) async* {
    if (state is Loading) {
      print('busy');
    } else {
      yield Loading();
      bool result =
          await userRepository.signup(username.trim(), password.trim());
      if (result) {
        yield SignUpSuccess();
      } else {
        yield SignUpFailure();
      }
    }
  }
}
