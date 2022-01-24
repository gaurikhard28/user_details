import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:user_details/bloc/signup_event.dart';
import 'package:user_details/bloc/signup_state.dart';
import 'package:user_details/resources/signup_repository.dart';



class signup_bloc
    extends Bloc<signupEvent, signupState> {
  final signup_repository Signup_repository;

  signup_bloc({required this.Signup_repository})
      : assert(signup_repository != null);

  @override
  signupState get initialState => signupUninitialized();

  @override
  Stream<signupState> mapEventToState(
      signupState currentState,
      signupEvent event,
      ) async* {
    if (event is AppStarted) {
      final bool hasToken = await Signup_repository.hasToken();

      if (hasToken) {
        yield signupAuthenticated();
      } else {
        yield signupUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield signupLoading();
      await Signup_repository.persistToken(event.token);
      yield signupAuthenticated();
    }

    if (event is LoggedOut) {
      yield signupLoading();
      await Signup_repository.deleteToken();
      yield signupUnauthenticated();
    }
  }
}