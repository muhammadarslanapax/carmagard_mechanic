import 'package:carmagard/Model/service_response.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Constant/dio_int.dart';
import '../Model/service_request_response.dart';
import '../Model/successresponse.dart';
import '../Service/baseurl.dart';
part 'service_request_provider.g.dart';

@Riverpod(keepAlive: true)
class MyServiceRequest extends _$MyServiceRequest {
  @override
  FutureOr<ServiceRequestResponse> build() async {
    final res = await _dio.get(ApiUrl.getServiceRequest);
    print(res.data);
    print(res.headers);
    // await Future.delayed(Duration(seconds: 120));
    return ServiceRequestResponse.fromJson(res.data);
  }

  late final _dio = ref.read(dioSProvider);
  Future<void> getBookings() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final res = await _dio.get(ApiUrl.getServiceRequest);

      return ServiceRequestResponse.fromJson(res.data);
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
class AcceptBooking extends _$AcceptBooking {
  @override
  Future<SuccessResponse> build() async {
    return SuccessResponse();
  }

  late final _dio = ref.read(dioSProvider);
  Future<void> acceptBooking(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final res = await _dio.put(ApiUrl.approveServiceRequest + id);
      print(res.data);
      res.data["status"] = id;
      ref.invalidate(myServiceRequestProvider);
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
