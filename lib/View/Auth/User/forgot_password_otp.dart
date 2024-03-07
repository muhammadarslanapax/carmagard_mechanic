import 'dart:developer';

import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/Provider/resetpasswordprovider.dart';
import 'package:carmagard/View/Auth/User/set_new_password.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Constant/utility_function.dart';
import '../../../Widget/custom_snackbar.dart';

class ForgotPasswordOtp extends StatefulWidget {
  const ForgotPasswordOtp({super.key});

  @override
  State<ForgotPasswordOtp> createState() => _ForgotPasswordOtpState();
}

class _ForgotPasswordOtpState extends State<ForgotPasswordOtp> with Ui {
  FormWidget? phoneNumber;
  FocusNode fcn = FocusNode();
  List<TextEditingController> fieldController =
      List.generate(4, (index) => TextEditingController());
  void clearText() {
    for (int i = 0; i < contrl.length; i++) {
      contrl[i].clear();
    }
  }

  List<TextEditingController> contrl = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void openKeyboard(FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }

  List<String> optToken = List.filled(4, 'null');
  List<FocusNode> focus = List.generate(4, (index) => FocusNode());
  @override
  void initState() {
    phoneNumber =
        FormWidget(inputText: '', text: 'Enter Phone Number', context: context);
    super.initState();
  }

  @override
  void dispose() {
    for (var element in contrl) {
      element.dispose();
    }
    super.dispose();
  }

  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pSymmetric(20, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: cStart,
                  children: [
                    Padding(
                      padding: pSymmetric(15, 0),
                      child: Column(
                        crossAxisAlignment: cStart,
                        children: [
                          input(black47, 28, 'Almost done!', w700),
                          input(
                              grey66,
                              14,
                              'Please enter the 4 digit pin that was sent to your mail',
                              w400),
                          hspacer(20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                4,
                                (index) => Container(
                                  height: 57,
                                  width: 57,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffBDC5C1)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                      obscureText: true,
                                      controller: contrl[index],
                                      focusNode: focus[index],
                                      maxLength: 1,
                                      keyboardType: TextInputType.number,
                                      onChanged: (input) {
                                        setState(() {
                                          optToken[index] = input;
                                        });
                                        if (input.isNotEmpty) {
                                          closeKeyboard(context);
                                          if (index < 3) {
                                            closeKeyboard(context);
                                            openKeyboard(focus[index + 1]);
                                          }
                                        }
                                      },
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 40,
                                      ),
                                      decoration: const InputDecoration(
                                          counterText: '',
                                          border: InputBorder.none)),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                hspacer(MediaQuery.sizeOf(context).height * 0.6),
                Consumer(builder: (_, ref, __) {
                  ref.listen(resetPasswordProvider, (previous, next) {
                    if (!next.isLoading && next.hasError) {
                      var snackBar = customSnackBar(errorBuilder(next.error));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                    if (next.value?.success == true && !next.isLoading) {
                      navW(context, const SetNewPassword());
                    }
                  });

                  return GestureDetector(
                      onTap: () async {
                        await ref
                            .read(resetPasswordProvider.notifier)
                            .verifyResetPassword(optToken.join());
                      },
                      child: button(
                          ref.watch(resetPasswordProvider).isLoading
                              ? buttonLoading()
                              : commonText("Confirm OTP", white),
                          green));
                }),
                hspacer(70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
