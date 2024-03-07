import 'package:carmagard/Model/mechanic_payments.dart';
import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/Service/baseurl.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Constant/dio_int.dart';

part 'payment_provider.g.dart';

@Riverpod(keepAlive: true)
class GetMechanicPayment extends _$GetMechanicPayment {
  @override
  FutureOr<MechanicPayments> build() async {
    final res = await _dio.get(ApiUrl.getMechanicPayments);
    print(res.data);
    return MechanicPayments.fromJson(res.data);
  }

  Dio _customDio() {
    final base = BaseOptions(baseUrl: ApiUrl.paymentUrl, headers: {
      "Authorization":
          "Bearer ${ref.read(loginMechProvider).value?.accessToken}",
    });

    return Dio(base);
  }

  late final _dio = _customDio();

  Future<void> getPayments() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final res = await _dio.get(ApiUrl.getMechanicPayments);
      return MechanicPayments.fromJson(res.data);
    });
    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
      print((state.error as DioException).response?.statusCode);
    }
  }
}
