import 'package:equatable/equatable.dart';

abstract class signupState extends Equatable {
  @override
  List<Object> get props => [];
}

class signupUninitialized extends signupState {}

class signupAuthenticated extends signupState {}

class signupUnauthenticated extends signupState {}

class signupLoading extends signupState {}