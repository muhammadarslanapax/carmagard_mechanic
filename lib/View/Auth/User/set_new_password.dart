import 'dart:developer';

import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/Provider/resetpasswordprovider.dart';
import 'package:carmagard/View/Auth/User/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Constant/utility_function.dart';
import '../../../Provider/success_related_functions_provider.dart';
import '../../../Widget/custom_snackbar.dart';

class SetNewPassword extends ConsumerStatefulWidget {
  const SetNewPassword({super.key});

  @override
  ConsumerState<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends ConsumerState<SetNewPassword> with Ui {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  FormWidget? phoneNumber;

  @override
  void initState() {
    phoneNumber =
        FormWidget(inputText: '', text: 'Enter Phone Number', context: context);
    super.initState();
  }

  bool load = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(successRelatedFunctionsProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        var snackBar = customSnackBar(errorBuilder(next.error));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      if (next.value?.success == true && !next.isLoading) {
        navW(context, const LoginScreen());
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pSymmetric(20, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height(context) - 200,
                  child: Column(
                    crossAxisAlignment: cStart,
                    children: [
                      Padding(
                        padding: pSymmetric(15, 0),
                        child: Column(
                          crossAxisAlignment: cStart,
                          children: [
                            input(black47, 28, "Set New Password", w700),
                            input(grey66, 14, "Enter your new password", w400),
                            hspacer(20),
                            TextFieldWithColumn(
                              hint: "Old Password",
                              controller: newPasswordController,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFieldWithColumn(
                              hint: "New Password",
                              controller: repeatPasswordController,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            /* const Spacer(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                  onPressed: () async {
                                    await ref
                                        .read(successRelatedFunctionsProvider
                                            .notifier)
                                        .saveNewPassword(
                                          newPasswordController.text.trim(),
                                        );
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(
                                          0xffFFA500), //const Color(0xffFFCC00),
                                      fixedSize: const Size.fromHeight(50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24))),
                                  child: Center(
                                    child: userInfo.isLoading
                                        ? const CircularProgressIndicator(
                                            backgroundColor: Colors.white,
                                            color: Color(0xffFFA500),
                                          )
                                        : const Text(
                                            "Update",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                  )),
                            ),*/
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                hspacer(MediaQuery.sizeOf(context).height * 0.15),
                GestureDetector(
                    onTap: () async {
                      await ref
                          .read(successRelatedFunctionsProvider.notifier)
                          .saveNewPassword(
                            newPasswordController.text.trim(),
                          );
                    },
                    child: button(
                        ref.watch(successRelatedFunctionsProvider).isLoading
                            ? buttonLoading()
                            : commonText("Finish", white),
                        green)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
