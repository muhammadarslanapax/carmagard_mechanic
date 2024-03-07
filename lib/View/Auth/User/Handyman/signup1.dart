import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/Widget/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carmagard/View/Auth/User/login.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/style.dart';

import '../../../../Constant/utility_function.dart';

class SignupScreen1 extends ConsumerStatefulWidget {
  const SignupScreen1({super.key});

  @override
  ConsumerState<SignupScreen1> createState() => _SignupScreen1State();
}

class _SignupScreen1State extends ConsumerState<SignupScreen1> with Ui {
  int process = 0;
  FormWidget? fullName;
  FormWidget? email;
  FormWidget? phoneNo;
  FormWidget? service;
  String password = '';
  bool showPassword = false;
  String password2 = '';
  bool showPassword2 = false;
  bool isChecked = false;
  bool load = false;

  @override
  void initState() {
    super.initState();

    fullName = FormWidget(inputText: '', text: 'Full name', context: context);
    email = FormWidget(inputText: '', text: 'Enter Email', context: context);
    service = FormWidget(
        inputText: '', text: 'Services you provide', context: context);
    phoneNo =
        FormWidget(inputText: '', text: 'Enter Password ', context: context);
    // phoneNo!.keyboard = TextInputType.number;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(signUpProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        var snackBar = customSnackBar(errorBuilder(next.error));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: cStart,
        children: [
          Padding(
            padding: pSymmetric(15, 0),
            child: Column(
              crossAxisAlignment: cStart,
              children: [
                input(black47, 28, 'Create Account', w700),
                input(grey66, 14, 'Please use the correct information here',
                    w400),
              ],
            ),
          ),
          fullName!.textField(),
          email!.textField(),
          phoneNo!.textField(),
          hspacer(MediaQuery.sizeOf(context).height * 0.3),
          GestureDetector(
              onTap: () async {
                await ref.read(signUpProvider.notifier).signUp(
                    fullName!.inputText!,
                    email!.inputText!,
                    phoneNo!.inputText!);
              },
              child: button(
                  ref.watch(signUpProvider).isLoading
                      ? buttonLoading()
                      : commonText('Create account', white),
                  green)),
          GestureDetector(
            onTap: () {
              nav(context, const LoginScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: black1f,
                        fontSize: 14,
                        fontWeight: w400,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      'Log in',
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
          ),
        ],
      ),
    );
  }
}
