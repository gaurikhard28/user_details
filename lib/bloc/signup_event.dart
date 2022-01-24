import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class signupEvent extends Equatable {
  signupEvent([List props = const []]) : super(props);
}

class AppStarted extends signupEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends signupEvent {
  final String token;

  LoggedIn({required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends signupEvent {
  @override
  String toString() => 'LoggedOut';
}



//AppStarted will be dispatched when the Flutter application first loads. It will notify bloc that it needs to determine whether or not there is an existing user.

//LoggedIn will be dispatched on a successful login. It will notify the bloc that the user has successfully logged in.

//LoggedOut will be dispatched on a successful logout. It will notify the bloc that the user has successfully logged out.