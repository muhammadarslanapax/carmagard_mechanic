import 'package:carmagard/Constant/utility_function.dart';
import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/Provider/shared_prefrence_provider.dart';
import 'package:carmagard/TabComponent/gps.dart';
import 'package:carmagard/View/Auth/User/Handyman/createaccount.dart';
import 'package:carmagard/View/Auth/User/forgot_password_otp.dart';
import 'package:carmagard/View/Auth/User/set_new_password.dart';
import 'package:carmagard/Widget/custom_snackbar.dart';
import 'package:carmagard/Widget/text_widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/Auth/User/forgetpassword.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/garage.dart';
import 'package:carmagard/View/style.dart';

import '../../../TabComponent/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Ui {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FormWidget? email;
  FormWidget? username;
  String password = '';
  bool showPassword = false;
  bool load = false;
  var rememberMe = false;

  @override
  void initState() {
    super.initState();

    email = FormWidget(inputText: '', text: 'Email Address', context: context);
    username = FormWidget(inputText: '', text: 'Username', context: context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return innnerLayout(Consumer(builder: (_, ref, __) {
      final mechanicName =
          ref.watch(sharedPreferenceProvider).getString("name");

      ref.listen(loginMechProvider, (previous, next) {
        if (!next.isLoading && next.hasError) {
          var snackBar = customSnackBar(errorBuilder(next.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }
        if (next.value?.success == true && !next.isLoading) {
          navW(context, const HomePage());
        }
      });
      return Column(
        crossAxisAlignment: cStart,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/login.svg',
              width: width(context),
              fit: BoxFit.fill,
            ),
          ),

          input(
              black47,
              28,
              "Welcome ${mechanicName != null ? "Back, $mechanicName" : ""}",
              w700),
          input(
              grey66,
              14,
              "${mechanicName != null ? "We’re glad you’re back." : ""} "
              "To use your account please login.",
              w400),
          hspacer(15),
          TextFieldWithColumn(
            hint: "Email Address",
            controller: emailController,
            keyType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 10,
          ),
          PasswordTextField(controller: passwordController, text: "Password"),
          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: (bool? value) => setState(() => rememberMe = value!),
                shape: const CircleBorder(),
              ),
              const NormalText(text: "Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  nav(context, const ForgetPassword2());
                },
                child: Align(
                  alignment: right,
                  child: Text(
                    'Forget password?',
                    style: TextStyle(
                        color: green,
                        fontSize: 14,
                        fontWeight: w400,
                        decoration: TextDecoration.underline,
                        decorationColor: green),
                  ),
                ),
              ),
            ],
          ),
          hspacer(20),
          GestureDetector(
              onTap: () async {
                await ref.read(loginMechProvider.notifier).login(
                    emailController.text.trim(), passwordController.text.trim(),
                    rememberMe: rememberMe);
              },
              child: button(
                  ref.watch(loginMechProvider).isLoading
                      ? buttonLoading()
                      : commonText('Log in', white),
                  green)),
          GestureDetector(
            onTap: () => nav(context, const CreateAccountHandyman()),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: TextStyle(
                        color: black1f,
                        fontSize: 14,
                        fontWeight: w400,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: green,
                        fontSize: 14,
                        fontWeight: w400,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), /*
          GestureDetector(
            onTap: () {
              nav(context, const GpsScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: input(black, 16, 'OR', w700)),
            ),
          ),
          Padding(
            padding: pSymmetric(5, 0),
            child: Material(
              elevation: 2,
              borderRadius: borderR(24),
              child: button(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: borderR(35),
                          child: Image.asset(
                            './assets/facebook.png',
                            width: 35,
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: input(
                              black1f, 16, 'Continue with facebook', bold))
                    ],
                  ),
                  white),
            ),
          ),

          Padding(
            padding: pSymmetric(5, 0),
            child: Material(
              elevation: 2,
              borderRadius: borderR(24),
              child: button(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: borderR(35),
                          child: Image.asset(
                            'assets/appleR2.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child:
                              input(black1f, 16, 'Continue with Apple', bold))
                    ],
                  ),
                  white),
            ),
          ),

          Padding(
            padding: pSymmetric(5, 0),
            child: Material(
              elevation: 2,
              borderRadius: borderR(24),
              child: button(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: center,
                          child: ClipRRect(
                            borderRadius: borderR(35),
                            child: Image.asset(
                              'assets/google.png',
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child:
                              input(black1f, 16, 'Continue with Google', bold))
                    ],
                  ),
                  white),
            ),
          ),

          const SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),*/
          // Center(child: SvgPicture.asset('assets/fingerprint.svg'))
        ],
      );
    }));
  }
}
