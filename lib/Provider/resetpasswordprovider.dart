import 'dart:developer';

import 'package:carmagard/Model/resetpassword.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Constant/dio_int.dart';
import '../Service/baseurl.dart';
part 'resetpasswordprovider.g.dart';

@riverpod
class ResetPassword extends _$ResetPassword {
  @override
  FutureOr<ResetPasswordResponse> build() async {
    return ResetPasswordResponse();
  }

  late final _dio = ref.read(dioSProvider);
  var _resetToken = "";

  Future<void> resetPassword(String email) async {
    state = const AsyncValue.loading();
    print("Reset Password ran");
    state = await AsyncValue.guard(() async {
      final res = await _dio.post(ApiUrl.forgotPassword, data: {
        "email": email,
      });
      print(res.data.runtimeType);
      print(res.headers);
      log("ResetPas: ${res.data}");
      _resetToken = (res.data as Map<String, dynamic>)["resetToken"];
      print("Rest Token: $_resetToken");
      return ResetPasswordResponse.fromJson(res.data);
    });
    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
    }
  }

  Future<void> verifyResetPassword(String code) async {
    state = const AsyncValue.loading();
    print("Verify Reset Password ran");
    print(state.value);
    print("Reset Token: ${state.value?.resetToken}");
    state = await AsyncValue.guard(() async {
      final res = await _dio.post(ApiUrl.verifyForgotPassword,
          data: {"reset_token": _resetToken, "reset_code": code});
      print(res.data.runtimeType);
      print(res.headers);
      print(res.requestOptions.data);
      final resPsw = res.headers.value("set-cookie")?.split(" ").first;

      ref.read(dioSProvider.notifier).updateCookie(resPsw ?? "");
      log("VerifyResetPas: ${res.data}");
      return ResetPasswordResponse.fromJson(res.data);
    });
    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
      print((state.error as DioException).response?.statusCode);
    }
  }
}
