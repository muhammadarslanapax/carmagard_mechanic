import 'package:carmagard/Model/review_response.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Constant/dio_int.dart';
import '../Service/baseurl.dart';
import 'loginprovider.dart';

part 'review_provider.g.dart';

@Riverpod(keepAlive: true)
class MechanicReviews extends _$MechanicReviews {
  @override
  FutureOr<ReviewResponse> build() async {
    final res = await _dio.get(
        "${ApiUrl.getReview}${ref.read(loginMechProvider).value?.mechanic?.id}");

    print("Review: ${res.data}");

    return ReviewResponse.fromJson(res.data);
  }

  Dio _customDio() {
    final base = ref
        .read(dioSProvider)
        .options
        .copyWith(baseUrl: "https://userapi.carmagard.com/api/v1/");
    return Dio(base);
  }

  late final _dio = _customDio();

  Future<void> getReviews() async {
    state = const AsyncValue.loading();
    final res = await _dio.get(
        "${ApiUrl.getReview}${ref.read(loginMechProvider).value?.mechanic?.id}");
    state = await AsyncValue.guard(() async {
      print(("Ran oo"));
      print(res.data);

      return ReviewResponse.fromJson(res.data);
    });

    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
      print((state.error as DioException).response?.statusCode);
    }
  }
}
