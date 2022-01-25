import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class signup_repository {
  Future<String> authenticate({
    required String phone,
    required String password,
    required String  name,

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
    sign(String contact,String password, String name ) async {
      Map data = {
        'contact': contact,
        'password': password,
        'name': name
      };
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var response = await http.post(Uri.parse(
          'https://sandbox.9930i.com/central/register'));
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON

      }
      else
        print(response.body);
    }
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}