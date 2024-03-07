import 'dart:convert';

import 'package:carmagard/View/Auth/User/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carmagard/Service/postapi.dart';
import 'package:carmagard/View/style.dart';

import '../Service/helper.dart';
import '../View/Auth/User/otp.dart';

@Deprecated("This function would be removed soon")
final authRepo = Provider<AuthProvider>((ref) => AuthProvider(ref));

@Deprecated("This class would be removed soon")
class AuthProvider extends StateNotifier with Ui {
  AuthProvider(super.state);
  int isSignup = 0;
  bool isUserSignUp = false;
  String authToken = '';
  Map userData = {};

  Future<Map<String, dynamic>> signup(Map body, context, WidgetRef refs) async {
    bool load = true;
    bool done = false;
    String accessToken = '';
    String url = 'm-registration';
    closeKeyboard(context);

    await Helper(url: url).helperPost(body).then((value) async {
      load = false;
      await value.fold((l) {
        // updateLoadLogin(false);
      }, (r) async {
        print(r.body);
        print(r.statusCode);
        // print(r.body);
        if (r.statusCode == 201 || r.statusCode == 200) {
          var res = jsonDecode(r.body);
          snackBar(res['message'], context);
          accessToken = res['activationToken'];
          done = true;
          navW(context, const OTPSCreen());
        } else {
          Map body = jsonDecode(r.body);
          var snackBar = SnackBar(
            backgroundColor: Colors.grey,
            content: Builder(builder: (context) {
              try {
                assert(body[body.keys.first][0].length > 1);
                return Text(
                  body[body.keys.first][0],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              } catch (e) {
                return const Text(
                  'Error in Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              }
            }),
          );
          // nav(context, const SetLocation());
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        // errorAlert('on data');
      });
    });
    return {'load': load, 'done': done, 'accessToken': accessToken};
  }

  Future<Map<String, dynamic>> verifyOtp(
      Map body, context, WidgetRef refs) async {
    bool load = true;
    bool done = false;
    String accessToken = '';
    String url = 'm-activate';
    closeKeyboard(context);

    await Helper(url: url).helperPost(body).then((value) async {
      load = false;
      await value.fold((l) {
        // updateLoadLogin(false);
      }, (r) async {
        // print(r.body);
        if (r.statusCode == 201 || r.statusCode == 200) {
          var res = jsonDecode(r.body);
          snackBar('Account Verified', context);

          // accessToken = res['activationToken'];
          done = true;

          navW(context, const LoginScreen());
        } else {
          Map body = jsonDecode(r.body);
          var snackBar = SnackBar(
            backgroundColor: Colors.grey,
            content: Builder(builder: (context) {
              try {
                assert(body[body.keys.first][0].length > 1);
                return Text(
                  body[body.keys.first][0],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              } catch (e) {
                return const Text(
                  'Error in Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              }
            }),
          );
          // nav(context, const SetLocation());
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        // errorAlert('on data');
      });
    });
    return {
      'load': load,
      'done': done,
    };
  }

  Future<Map<String, dynamic>> login(
      String email, String password, context, WidgetRef refs) async {
    bool load = true;
    bool done = false;
    Map userData = {};
    String accessToken = '';

    closeKeyboard(context);

    var post =
        PostApi(body: {"email": email, "password": password}, url: 'login');

    await post.postApi().then((value) async {
      load = false;
      await value.fold((l) {}, (r) async {
        // print(r.body);
        var res = jsonDecode(r.body);
        if (r.statusCode == 201 || r.statusCode == 200) {
          // snackBar('registration successfully completed', context);
          userData = res['user'];
          accessToken = res['accessToken'];
          done = true;
          // navW(context, const LoginPage());
        } else {
          var errorMessage = res['message'];
          var snackBar = SnackBar(
            backgroundColor: Colors.grey,
            content: Builder(builder: (context) {
              try {
                // assert(body[body.keys.first][0].length > 1);
                return Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              } catch (e) {
                return const Text(
                  'Error in Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                );
              }
            }),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        // errorAlert('on data');
      });
    });
    return {
      'load': load,
      'done': done,
      'userData': userData,
      'accessToken': accessToken
    };
  }
}
