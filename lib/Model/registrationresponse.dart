import 'dart:convert';

/// success : true
/// message : "Please check your email: mechanic@gmail.com to activate your account!"
/// activationToken : "eyJhbGciOiJIUzI1NiIsInxxxxxxxxXVCJ9.eyJtZWNoYW5pYyI6eyJlbWFpbCI6InN0ZXZvbGlzaXNqb3NlcGhwdXJAZ21haWwuY29tIiwibWVjaGFuaWNOYW1lIjoiSmFtZXMgSHVsayIsInBhc3xxxxxxxxxxxxxZXNodWxrIn0sImFjdGl2YXRpb25Db2RlIjoiMzg4NSIsImlhdCI6MTcwMzQ1Mjk4MiwiZXhwIjoxNzAzNDUzMjgyfQ.NXXd4BxxxxxxxxxxWV1GSVLQqC3yPClfAEOUuN_sEcKRw"

RegistrationResponse registrationResponseFromJson(String str) =>
    RegistrationResponse.fromJson(json.decode(str));
// String registrationResponseToJson(RegistrationResponse data) =>
//     json.encode(data.toJson());

class RegistrationResponse {
  RegistrationResponse({
    this.success,
    this.message,
    this.activationToken,
  });

  RegistrationResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    activationToken = json['activationToken'];
  }
  bool? success;
  String? message;
  String? activationToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['activationToken'] = activationToken;
    return map;
  }

  @override
  String toString() {
    return 'RegistrationResponse{success: $success, '
        'message: $message, activationToken: $activationToken}';
  }
}
