import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class login_state extends Equatable {
  login_state();

  @override
  List<Object> get props => [];
}

class LoginInitial extends login_state {}

class LoginLoading extends login_state {}

class LoginFailure extends login_state {
  final String error;

   LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}