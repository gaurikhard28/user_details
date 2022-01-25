import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


class signinState extends Equatable {
  signinState();

  @override
  List<Object> get props => [];
}

class signinInitial extends signinState {}

class signinLoading extends signinState {}

class signinFailure extends signinState {
  final String error;

   signinFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'signinFailure { error: $error }';
}