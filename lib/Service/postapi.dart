import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:carmagard/Service/baseurl.dart';
import 'package:http/http.dart' as https;

@Deprecated("This class would be removed soon")
class PostApi {
  final String url;
  final Map body;
  String? userToken;

  PostApi({
    required this.url,
    required this.body,
  });

  Future<Either<Exception, https.Response>> postApi() async {
    try {
      final response = await https.post(
          Uri.parse(
            '${ApiUrl.baseUrl}$url',
          ),
          headers: {
            "Content-Type": "application/json",
          },
          body: const JsonEncoder().convert(body));
      print('${ApiUrl.baseUrl}$url');
      log('ggg:${response.body}');

      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, https.StreamedResponse>> loginApi(
      String email, String password, String username) async {
    var url = Uri.parse('https://handyman-amber.vercel.app/users/login/');

    // Create a new multipart request

    var request = https.MultipartRequest('POST', url);
    request.fields['email'] = email;
    request.fields['username'] = 'Adeyemi';
    request.fields['password'] = password;
    try {
      var response = await request.send();

      // Check if the response is successful (status code 200)
      // var responseBody = await response.stream.bytesToString();

      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<void> sendFormData(String email, String password) async {
    var url = Uri.parse('https://handyman-amber.vercel.app/users/login/');

    // Create a new multipart request
    var request = https.MultipartRequest('POST', url);

    // Add fields (in this case, email and password)
    request.fields['email'] = email;
    request.fields['username'] = 'Adeyemi';
    request.fields['password'] = password;

    // Send the request
  }

  Future<Either<Exception, https.Response>> postApiToken(String token) async {
    try {
      final response = await https.post(
          Uri.parse(
            '${ApiUrl.baseUrl}$url',
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $token',
          },
          body: const JsonEncoder().convert(body));
      log('${ApiUrl.baseUrl}$url');
      log(response.body);
      log(response.statusCode.toString());
      log(token);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
