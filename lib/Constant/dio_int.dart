import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/Service/baseurl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_int.g.dart';

@Riverpod(keepAlive: true)
class DioS extends _$DioS {
  @override
  Dio build() {
    final baseOption = BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        headers: <String, dynamic>{"cookie": ""},
        sendTimeout: const Duration(seconds: 12),
        receiveTimeout: const Duration(seconds: 12));

    return Dio(baseOption);
  }

  void updateCookie(String token) {
    state.options.headers.update("cookie", (value) => token);
  }
}
