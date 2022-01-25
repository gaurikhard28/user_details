import 'dart:async';
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
  })  :  super(signinState());

  @override
  void onTransition(Transition<signinEvent, signinState> transition) {
    super.onTransition(transition);
    print(transition);
  }

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

        Signup_bloc.add(LoggedIn(token: token));
        yield signinInitial();
      } catch (error) {
        yield signinFailure(error: error.toString());
      }
    }
  }

}