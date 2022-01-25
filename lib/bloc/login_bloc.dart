import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:user_details/bloc/signup_bloc.dart';
import 'package:user_details/bloc/signup_event.dart';
import 'package:user_details/resources/login_repository.dart';
import 'login_events.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<login_events, login_state> {
  final login_repository Login_repository;
  final signup_bloc Signup_bloc;

  LoginBloc({
    required this.Login_repository,
    required this.Signup_bloc,
  })  :  super(login_state());

  @override
  void onTransition(Transition<login_events, login_state> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  login_state get initialState => LoginInitial();

  @override
  Stream<login_state> mapEventToState(
      login_state currentState,
      login_events event,
      ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await Login_repository.authenticate(
          phone: event.phone,
          password: event.password,
        );

        Signup_bloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}