import 'dart:developer';

import 'package:carmagard/Provider/shared_prefrence_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Constant/dio_int.dart';
import '../Model/successresponse.dart';
import '../Service/baseurl.dart';
import 'loginprovider.dart';
import 'rating_provider.dart';
import 'review_provider.dart';
import 'service_request_provider.dart';
part 'success_related_functions_provider.g.dart';

/// This class holds all functions that returns
/// {
///     "success": true
/// }
/// The map might also contain other stuffs limited to 1-2 keys
@riverpod
class SuccessRelatedFunctions extends _$SuccessRelatedFunctions {
  @override
  FutureOr<SuccessResponse> build() async {
    return SuccessResponse();
  }

  late final _dio = ref.read(dioSProvider);

  void _resetPref() {
    final reset = ref.read(sharedPreferenceProvider);
    reset.remove("email");
    reset.remove("password");
    reset.remove("login_expire_in");
  }

  /// Activate mechanic account
  Future<void> activateMechanic(String code) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // print(ref.read(signUpProvider).value?.activationToken);
      final res = await _dio.post(ApiUrl.activation, data: {
        "activation_token": ref.read(signUpProvider).value?.activationToken,
        "activation_code": code,
      });
      print(res);
      print(res.data.runtimeType);
      log("RegRes: ${res.data}");
      return SuccessResponse.fromJson(res.data);
    });
    print(state.error);
    /*if (!state.hasError) {
      ref.read(signUpPageIndexProvider.notifier).update((state) => 2);
    }*/
  }

  /// Log the user out
  Future<void> logout() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final res = await _dio.post(ApiUrl.logout);
      log("RegRes: ${res.data}");

      /// Clear user details
      _resetPref();

      ref.invalidate(myServiceRequestProvider);
      ref.invalidate(loginMechProvider);
      ref.invalidate(mechanicReviewsProvider);
      ref.invalidate(mechanicRatingProvider);
      return SuccessResponse.fromJson(res.data);
    });

    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
    }
  }

  /// This is used when the user password is reset
  Future<void> saveNewPassword(String newPass) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final res = await _dio
          .post(ApiUrl.saveNewPassword, data: {"new_password": newPass});
      print(res);
      print(res.headers);
      log("RegRes: ${res.data}");
      return SuccessResponse.fromJson(res.data);
    });

    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
      print((state.error as DioException).response?.statusCode);
    }
  }
}

@riverpod
class SetMechanicCoordinate extends _$SetMechanicCoordinate {
  @override
  FutureOr<SuccessResponse> build() async {
    return SuccessResponse();
  }

  late final _dio = ref.read(dioSProvider);
  Future<void> setCoordinate(String newPass) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final res = await _dio.put(ApiUrl.setMechanicCoordinate,
          data: {"latitude": "51.505", "longitude": "-0.09"});
      print(res);

      log("Set Coordinate: ${res.data}");
      return SuccessResponse.fromJson(res.data);
    });

    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
      print((state.error as DioException).response?.statusCode);
    }
  }
}
