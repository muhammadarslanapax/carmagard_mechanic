import 'package:dio/dio.dart';

String? firstToUpperCase(String? value) {
  if (value == null) return null;
  if (value[0].contains(RegExp(r"^[A-Z]"))) {
    return value;
  }
  return value[0].toUpperCase() + value.substring(1);
}

String errorBuilder(Object? error) {
  final String errorReturn;

  if (error is DioException) {
    errorReturn =
        ((error).response?.data as Map<String, dynamic>)["message"] ?? "";
  } else if (error is Exception) {
    errorReturn = (error).toString();
  } else {
    errorReturn = "An error occurred";
  }
  return errorReturn;
}
