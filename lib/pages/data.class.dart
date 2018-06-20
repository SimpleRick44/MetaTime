import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class ArgonData {
  String token;
  String user;
  static ArgonData data = new ArgonData();
  static String api = "http://192.168.178.217:5000/api";
  Future<String> login(String email, String passwort) async {
    http.Response res = await http.post(
      api + '/login',
      body: JSON.encode(
        {
          "passwort": passwort,
          "email": email,
        },
      ),
      headers: {
        HttpHeaders.CONTENT_TYPE: "application/json",
      },
    );
    if (res.statusCode == 200) {
      this.user = email;
      this.token = JSON.decode(res.body)["token"];
    }
    return this.token;
  }

  Future<dynamic> fetch(var jsql) async {
    http.Response res = await http.post(
      api + '/login',
      body: JSON.encode(jsql),
      headers: {
        HttpHeaders.CONTENT_TYPE: "application/json",
        "X-Auth-Token": token,
      },
    );
    if (res.statusCode == 200) {
      return json.decode(res.body)["rows"];
    }
    return null;
  }
}
