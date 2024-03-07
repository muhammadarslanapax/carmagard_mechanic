import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:carmagard/View/Auth/User/Handyman/signup1.dart';
import 'package:carmagard/View/Auth/User/otp.dart';
import 'package:carmagard/View/Auth/User/otptoken.dart';
import 'package:carmagard/View/style.dart';

import '../../../../Provider/loginprovider.dart';

class CreateAccountHandyman extends StatefulWidget {
  const CreateAccountHandyman({super.key});

  @override
  State<CreateAccountHandyman> createState() => _CreateAccountHandymanState();
}

class _CreateAccountHandymanState extends State<CreateAccountHandyman> with Ui {
  int process = 0;
  PageController pagecontrl = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
      child: Consumer(builder: (_, ref, __) {
        ref.watch(signUpProvider);
        return SafeArea(
          child: Column(
            crossAxisAlignment: cStart,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  children: [
                    backNav(context),
                    wspacer(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          2,
                          (index) => Container(
                                width: (width(context) - 100) / 2, //3,
                                margin: pSymmetric(0, 3),
                                height: 6,
                                decoration: BoxDecoration(
                                  borderRadius: borderR(8),
                                  color: ref.watch(signUpPageIndexProvider) ==
                                          index
                                      ? green
                                      : Colors.grey,
                                ),
                              )),
                    )
                  ],
                ),
              ),
              switch (ref.watch(signUpPageIndexProvider)) {
                0 => const SignupScreen1(),
                _ => const OTPSCreen(),
                // _ => const OTPToken()
              },
            ],
          ),
        );
      }),
    ));
  }
}
