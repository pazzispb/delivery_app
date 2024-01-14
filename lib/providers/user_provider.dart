import 'dart:convert';

import 'package:delivery_app/api/environment.dart';
import 'package:flutter/material.dart';
import '../models/response_api.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  String _url = Environment.API_DELIVERY;
  String _api = "/api/users";

  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
    return null;
  }

  Future<ResponseApi?> createUser(User user) async {
    try {
      Uri uri = Uri.http(_url, "$_api/create");
      String bodyParams = json.encode(user);
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(uri, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (error) {
      print(error);
    }
  }

  Future<ResponseApi?> login(String email, String password) async {
    try {
      Uri uri = Uri.http(_url, "$_api/login");
      String bodyParams = json.encode({"email":email, "password":password});
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(uri, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (error) {
      print(error);
    }
  }
}
