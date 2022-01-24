import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:user_details/bloc/signin_events.dart';
import 'package:user_details/bloc/signin_state.dart';
import 'package:user_details/bloc/signup_bloc.dart';
import 'package:user_details/bloc/signup_event.dart';
import 'package:user_details/resources/signup_repository.dart';

class signinBloc extends Bloc<signinEvent, signinState> {
  final signup_repository Signup_repository;
  final signup_bloc Signup_bloc;

  signinBloc({
    required this.Signup_repository,
    required this.Signup_bloc,
  })  : assert(Signup_repository != null),
        assert(Signup_bloc != null);

  @override
  signinState get initialState => signinInitial();

  @override
  Stream<signinState> mapEventToState(
      signinState currentState,
      signinEvent event,
      ) async* {
    if (event is signinButtonPressed) {
      yield signinLoading();

      try {
        final token = await Signup_repository.authenticate(
          name: event.name,
          password: event.password,
          phone: event.phone,
        );

        Signup_bloc.dispatch(LoggedIn(token: token));
        yield signinInitial();
      } catch (error) {
        yield signinFailure(error: error.toString());
      }
    }
  }
}