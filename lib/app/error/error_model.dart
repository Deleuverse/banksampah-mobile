// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  List<Error> errors;

  ErrorModel({
    required this.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class Error {
  String message;
  String rule;
  String field;

  Error({
    required this.message,
    required this.rule,
    required this.field,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        message: json["message"],
        rule: json["rule"],
        field: json["field"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "rule": rule,
        "field": field,
      };
}
