import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class login_events extends Equatable {
   login_events();
}

class LoginButtonPressed extends login_events {
  final String phone;
  final String password;

   LoginButtonPressed({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [phone, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $phone, password: $password }';
}