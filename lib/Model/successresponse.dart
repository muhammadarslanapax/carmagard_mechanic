import 'dart:convert';

/// success : true
/// message : "Logged out successfully"

SuccessResponse successResponseFromJson(String str) =>
    SuccessResponse.fromJson(json.decode(str));
// /*String successResponseToJson(SuccessResponse data) =>
//     json.encode(data.toJson());*/

class SuccessResponse {
  SuccessResponse({
    this.success,
    this.message,
  });

  SuccessResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    status = json['status'];
  }
  bool? success;
  String? message;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['status'] = status;
    return map;
  }

  @override
  String toString() {
    return 'SuccessResponse{success: $success, message: $message,'
        ' status: $status}';
  }
}
