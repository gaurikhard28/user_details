import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:user_details/bloc/login_state.dart';

class login_repository {
  Future<String> authenticate({
    required String phone,
    required String password,


  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain

    await Future.delayed(Duration(seconds: 1));

    return false;
  }
}