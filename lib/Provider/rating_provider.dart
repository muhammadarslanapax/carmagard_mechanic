import 'package:carmagard/Model/rating_response.dart';
import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/Service/baseurl.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Constant/dio_int.dart';
part 'rating_provider.g.dart';

@Riverpod(keepAlive: true)
class MechanicRating extends _$MechanicRating {
  @override
  FutureOr<RatingResponse> build() async {
    final res = await _dio.get(
        "${ApiUrl.getRating}${ref.read(loginMechProvider).value?.mechanic?.id}");

    print("Review: ${res.data}");

    return RatingResponse.fromJson(res.data);
  }

  Dio _customDio() {
    final base = ref
        .read(dioSProvider)
        .options
        .copyWith(baseUrl: "https://userapi.carmagard.com/api/v1/");
    return Dio(base);
  }

  late final _dio = _customDio();

  Future<void> getRating() async {
    state = const AsyncValue.loading();
    final res = await _dio.get(
        "${ApiUrl.getRating}${ref.read(loginMechProvider).value?.mechanic?.id}");
    state = await AsyncValue.guard(() async {
      print(("Ran oo"));
      print(res.data);

      return RatingResponse.fromJson(res.data);
    });
    print(state.hasError);
    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
      print((state.error as DioException).response?.statusCode);
    }
  }
}
