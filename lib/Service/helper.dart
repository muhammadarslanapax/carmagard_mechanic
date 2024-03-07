import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'postapi.dart';

class Helper {
  String? token;
  String? url;
  Helper({required this.url});
  Future<Either<Exception, Response>> helperPost(Map body) async {
    final apiResult = await PostApi(body: body, url: url!).postApi();
    return apiResult.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }

  // Future<Either<Exception, Response>> helperPost1(Map body) async {
  //   final apiResult = await PostApi(body: body, url: url!).postApi1();
  //   return apiResult.fold((l) => Left(l), (r) {
  //     return Right(r);
  //   });
  // }

  Future<Either<Exception, Response>> helperPostToken(Map body) async {
    final apiResult = await PostApi(body: body, url: url!).postApiToken(token!);
    return apiResult.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }

  // Future<Either<Exception, Response>> helperPatchToken(Map body) async {
  //   final apiResult =
  //       await PostApi(body: body, url: url!).patchApiToken(token!);
  //   return apiResult.fold((l) => Left(l), (r) {
  //     return Right(r);
  //   });
  // }

  // Future helperGetToken() async {
  //   print(url);
  //   int code = 404;
  //   dynamic data;

  //   while (code == 404) {
  //     final apiResult = await GetApi(url: url!).getTokenApi(token!);
  //     apiResult.fold((l) => Left(l), (r) {
  //       data = jsonDecode(r.body);

  //       code = r.statusCode;
  //     });
  //   }
  //   return data;
  // }

  // Future helperGetTokenSand() async {
  //   int code = 404;
  //   dynamic data;

  //   while (code == 404) {
  //     final apiResult = await GetApi(url: url!).getTokenApiSand();
  //     apiResult.fold((l) => Left(l), (r) {
  //       data = jsonDecode(r.body);

  //       code = r.statusCode;
  //     });
  //   }

  //   return data;
  // }

  // Future helperGetToken2() async {
  //   int code = 404;
  //   dynamic data;

  //   while (code == 404) {
  //     final apiResult = await GetApi(url: url!).getTokenApi2(token!);
  //     apiResult.fold((l) => Left(l), (r) {
  //       data = jsonDecode(r.body);

  //       code = r.statusCode;
  //     });
  //   }
  //   return data;
  // }

  // Future helperGet() async {
  //   int code = 404;
  //   dynamic data;

  //   while (code == 404) {
  //     final apiResult = await GetApi(url: url!).getApi();
  //     apiResult.fold((l) => Left(l), (r) {
  //       data = jsonDecode(r.body);
  //       print(data);
  //       code = r.statusCode;
  //     });
  //   }
  //   return data;
  // }
}
