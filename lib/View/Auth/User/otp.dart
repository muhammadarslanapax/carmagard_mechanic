import 'dart:developer';

import 'package:carmagard/Provider/loginprovider.dart';
import 'package:carmagard/View/Auth/User/login.dart';
import 'package:carmagard/Widget/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Provider/success_related_functions_provider.dart';

class OTPSCreen extends ConsumerStatefulWidget {
  const OTPSCreen({super.key});

  @override
  ConsumerState<OTPSCreen> createState() => _OTPSCreenState();
}

class _OTPSCreenState extends ConsumerState<OTPSCreen> with Ui {
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

  bool load = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(successRelatedFunctionsProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        final error = (next.error as DioException).response?.data
            as Map<String, dynamic>?;
        var snackBar = customSnackBar(error?["message"] ?? "");

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      if (next.value?.success == true && !next.isLoading) {
        navW(context, const LoginScreen());
      }
    });
    return Padding(
      padding: pSymmetric(20, 20),
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
                                border:
                                    Border.all(color: const Color(0xffBDC5C1)),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                controller: contrl[index],
                                focusNode: focus[index],
                                maxLength: 1,
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
                                    counterText: '', border: InputBorder.none)),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          hspacer(MediaQuery.sizeOf(context).height * 0.55),
          Consumer(builder: (_, ref, __) {
            return GestureDetector(
                onTap: () async {
                  await ref
                      .read(successRelatedFunctionsProvider.notifier)
                      .activateMechanic(optToken.join());
                },
                child: button(
                    ref.watch(successRelatedFunctionsProvider).isLoading
                        ? buttonLoading()
                        : commonText("Finish", white),
                    green));
          }),
          hspacer(10),
        ],
      ),
    );
  }
}
