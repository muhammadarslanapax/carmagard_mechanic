// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';

import 'package:carmagard/Constant/dio_int.dart';
import 'package:carmagard/Model/loginresponse.dart';
import 'package:carmagard/Model/registrationresponse.dart';
import 'package:carmagard/Model/successresponse.dart';
import 'package:carmagard/Provider/rating_provider.dart';
import 'package:carmagard/Provider/review_provider.dart';
import 'package:carmagard/Provider/service_request_provider.dart';
import 'package:carmagard/Provider/shared_prefrence_provider.dart';
import 'package:carmagard/Service/baseurl.dart';
import 'package:carmagard/View/style.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loginprovider.g.dart';

final signUpPageIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

@Riverpod(keepAlive: true)
class LoginMech extends _$LoginMech with Ui {
  @override
  FutureOr<LoginResponse?> build() async => null;

  late final _dio = ref.read(dioSProvider);

  void _setRememberMe(String email, String password) {
    ref.read(sharedPreferenceProvider).setString("email", email);
    ref.read(sharedPreferenceProvider).setString("password", password);
  }

  Future<void> login(String email, String password,
      {bool rememberMe = false}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final res = await _dio.post(ApiUrl.login, data: {
        "email": email,
        "password": password,
      });
      final token = (res.data as Map<String, dynamic>)["accessToken"];
      final refreshToken = res.headers.map["set-cookie"]?.last.split(" ").first;
      final cookie = "m_access_token=$token;$refreshToken";

      if (rememberMe) {
        _setRememberMe(email, password);
        ref.read(sharedPreferenceProvider).setString("login_expire_in",
            DateTime.now().add(const Duration(days: 6, hours: 20)).toString());
      }

      ref.read(dioSProvider.notifier).updateCookie(cookie);
      return LoginResponse.fromJson(res.data);
    });

    ref.read(sharedPreferenceProvider).setString(
        "name",
        state.value?.mechanic?.firstName ??
            state.value?.mechanic?.mechanicName ??
            "");
  }

  Future<void> updateDetails(
      String fName, String lName, String mName, String address) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final res = await _dio.post(ApiUrl.setProfile, data: {
        "firstName": fName,
        "lastName": lName,
        "middleName": mName,
        "address": address
      });
      print(res.data.runtimeType);
      print(res.headers);
      log("UpdateRes: ${res.data}");
      return LoginResponse.fromJson(res.data);
    });
    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
    }
  }

  Future<void> changePassword(String oldPass, String newPass) async {
    state = const AsyncValue.loading();
    print("Change Password ran");
    state = await AsyncValue.guard(() async {
      final res = await _dio.put(ApiUrl.updatePassword, data: {
        "oldPassword": oldPass,
        "newPassword": newPass,
      });
      print(res.data.runtimeType);
      print(res.headers);
      log("ChangeRes: ${res.data}");
      return LoginResponse.fromJson(res.data);
    });
    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
    }
  }
}

/// Implementation for SignUp provider
@riverpod
class SignUp extends _$SignUp {
  @override
  FutureOr<RegistrationResponse> build() async {
    return RegistrationResponse();
  }

  late final _dio = ref.read(dioSProvider);

  Future<void> signUp(String name, String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final res = await _dio.post(ApiUrl.signUp, data: {
        "mechanicName": name,
        "email": email,
        "password": password,
      });

      log("RegRes: ${res.data}");
      return RegistrationResponse.fromJson(res.data);
    });
    if (!state.hasError) {
      ref.read(signUpPageIndexProvider.notifier).update((state) => 1);
    }
  }
}
