import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class signinEvent extends Equatable {
  signinEvent();
}

class signinButtonPressed extends signinEvent {
 final String name;
   final String password;
   final String phone;



   signinButtonPressed({
    required this.name,
    required this.password,
     required this.phone,
  });

  @override
  List<Object> get props => [name, password,phone];

  @override
  String toString() =>
      'signinButtonPressed { name: $name, password: $password, phone:$phone }';
}