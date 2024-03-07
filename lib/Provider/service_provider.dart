import 'package:carmagard/Model/service_response.dart';
import 'package:carmagard/Service/baseurl.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Constant/dio_int.dart';
part 'service_provider.g.dart';

@riverpod
class AllServices extends _$AllServices {
  @override
  FutureOr<ServiceResponse> build() async {
    final res = await _dio.get(ApiUrl.getUserService);
    print(res.data);
    print(res.headers);
    return ServiceResponse.fromJson(res.data);
  }

  late final _dio = ref.read(dioSProvider);

  /// This function gets the general available services.
  Future<void> addService(List service) async {
    // state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      var res = await _dio.put(ApiUrl.setService, data: {"services": service});
      print(res.data);
      print(res.headers);

      res = await _dio.get(ApiUrl.getUserService);
      return ServiceResponse.fromJson(res.data);
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
FutureOr<ServiceResponse> systemServices(SystemServicesRef ref) async {
  final res = await ref.read(dioSProvider).get(ApiUrl.getAllService);
  final re = ServiceResponse.fromJson(res.data);

  re.services?.removeWhere((element) {
    final userElements = ref.watch(allServicesProvider).value?.services;
    if (userElements?.isNotEmpty ?? false) {
      for (var i in userElements!) {
        if (i.name == element.name) {
          return true;
        }
      }
    }
    return false;
  });
  return re;
  // ServiceResponse.fromJson(res.data);
}
