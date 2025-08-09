import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo_frontend/models/user_model.dart';

class AuthService {
  static const String baseUrl = 'http://50.0.43.45:8000/api';

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';

      return user;
    } else {
      throw Exception('Register Failed');
    }
  }
}
