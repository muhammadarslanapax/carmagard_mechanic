import 'dart:convert';

/// reset_token : "eyJhbGciOiJIUzxxxxxxxxxxxxxxpXVCJ9.eyJlbWFpbCI6InN0ZXZlbnRzdWh5ZWxAZ21haWwuY29tIiwicmVzZXRDb2RlIjoiNjQ5OSIsImlhdCI6MTcwMzUyODxxxxxxxxxxxxIjoxNzAzNTI5MTM5fQ.JIEHGrWR0ElGjxxxxxxxDzJ6ZqSt9bf2Pt0sjihxRkI"
/// reset_code : "6499"
/*
ResetPasswordResponse resetPasswordFromJson(String str) =>
    ResetPasswordResponse.fromJson(json.decode(str));

String resetPasswordToJson(ResetPasswordResponse data) =>
    json.encode(data.toJson());
*/

class ResetPasswordResponse {
  ResetPasswordResponse({
    this.resetToken,
    this.resetCode,
    this.success,
    this.message,
  });

  ResetPasswordResponse.fromJson(dynamic json) {
    resetToken = json['reset_token'];
    resetCode = json['reset_code'];
    success = json['success'];
    message = json['message'];
  }
  String? resetToken;
  String? resetCode;
  bool? success;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reset_token'] = resetToken;
    map['reset_code'] = resetCode;
    map['success'] = success;
    map['message'] = message;
    return map;
  }

  @override
  String toString() {
    return 'ResetPasswordResponse{resetToken: $resetToken, '
        'resetCode: $resetCode, success: $success, message: $message}';
  }
}
