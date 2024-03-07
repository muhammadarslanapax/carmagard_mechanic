import 'package:carmagard/Model/successresponse.dart';
import 'package:carmagard/Model/ticket_response.dart';
import 'package:carmagard/Model/tickets_response.dart';
import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/Service/baseurl.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../Constant/dio_int.dart';
part 'tickets_provider.g.dart';

@riverpod
class AllTickets extends _$AllTickets {
  @override
  FutureOr<TicketsResponse> build() async {
    // final dio = _customDio();
    // print("Dio cookie: ${_dio.options.headers}");
    final res = await _dio.get(ApiUrl.getAllTickets);

    return TicketsResponse.fromJson(res.data);
    // return TicketsResponse();
  }

  Dio _customDio() {
    final base = ref
        .read(dioSProvider)
        .options
        .copyWith(baseUrl: "https://userapi.carmagard.com/api/v1/");
    return Dio(base);
  }

  late final _dio = _customDio();
  Future<void> getAllTickets() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      // print("Dio cookie: ${_dio.options.headers}");
      final res = await _dio.get(ApiUrl.getAllTickets);

      return TicketsResponse.fromJson(res.data);
    });
    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
      print((state.error as DioException).response?.statusCode);
    }
  }
}

@Riverpod(keepAlive: true)
Future<SingleTicketResponse> getTicket(GetTicketRef ref, String id) async {
  final base = ref
      .read(dioSProvider)
      .options
      .copyWith(baseUrl: "https://userapi.carmagard.com/api/v1/");
  final dio = Dio(base);
  final res = await dio.get(ApiUrl.getTicket + id);
  return SingleTicketResponse.fromJson(res.data);
}
// /*
// @riverpod
// class GetTicket extends _$GetTicket {
//   @override
//   FutureOr<SingleTicketResponse?> build() async {
//     return SingleTicketResponse();
//   }
//
//   Dio _customDio() {
//     final base = ref
//         .read(dioSProvider)
//         .options
//         .copyWith(baseUrl: "https://userapi.carmagard.com/api/v1/");
//     return Dio(base);
//   }
//
//   late final _dio = _customDio();
//   Future<void> getTicket(String id) async {
//     state = const AsyncValue.loading();
//
//     state = await AsyncValue.guard(() async {
//       final res = await _dio.get(ApiUrl.getTicket + id);
//       return SingleTicketResponse.fromJson(res.data);
//     });
//     if (state.hasError) {
//       print((state.error as DioException).response?.data);
//       print((state.error as DioException).response?.headers);
//       print((state.error as DioException).requestOptions.headers);
//       print((state.error as DioException).response?.statusCode);
//     }
//   }
// }*/

@riverpod
class AddTicket extends _$AddTicket {
  @override
  FutureOr<SuccessResponse?> build() async {
    return SuccessResponse();
  }

  Dio _customDio() {
    final base = ref
        .read(dioSProvider)
        .options
        .copyWith(baseUrl: "https://userapi.carmagard.com/api/v1/");
    return Dio(base);
  }

  late final _dio = _customDio();

  Future<void> addTicket(
      String subject, String category, String priority, String description,
      {String attachments = ""}) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      print("Email oo: ${ref.read(loginMechProvider).value?.mechanic?.email}");
      final data = FormData.fromMap({
        "subject": subject,
        "email": ref.read(loginMechProvider).value?.mechanic?.email, //email,
        "category": category,
        "priority": priority, //3 type- high, medium and low
        "description": description,
        "attachments": attachments, // file
      });

      final res = await _dio.post(ApiUrl.addTicket, data: data);
      print(res.data);
      ref.invalidate(allTicketsProvider);
      return SuccessResponse.fromJson(res.data);
    });
    if (state.hasError) {
      print((state.error as DioException).response?.data);
      print((state.error as DioException).response?.headers);
      print((state.error as DioException).requestOptions.headers);
      print((state.error as DioException).response?.statusCode);
    }
  }

  Future<void> replyTicket(String msg, String id, {XFile? attachments}) async {
    state = await AsyncValue.guard(() async {
      final images = attachments != null
          ? await MultipartFile.fromFile(attachments.path,
              filename: attachments.name)
          : "";

      final data = FormData.fromMap({
        "msg": msg,
        "attachments": images, // file
      });

      final res = await _dio.post(ApiUrl.replyTicket + id, data: data);

      ref.invalidate(getTicketProvider.call(id));

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
