// To parse this JSON data, do
//
//     final responseApi = responseApiFromJson(jsonString);

import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  bool? succes;
  String? message;
  String? error;
  dynamic data;

  ResponseApi({
    required this.succes,
    required this.message,
    required this.error,
  });

  ResponseApi.fromJson(Map<String, dynamic> json) {
    succes = json["succes"];
    message = json["message"];
    error = json["error"];

    try {
      data = json["data"];
    } catch (error) {
      print('Error: ${error}');
    }
  }

  Map<String, dynamic> toJson() => {
        "succes": succes,
        "message": message,
        "error": error,
        "data": data,
      };
}
