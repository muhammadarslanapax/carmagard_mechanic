import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carmagard/View/Auth/User/Handyman/createaccount.dart';
import 'package:carmagard/View/Auth/User/login.dart';
import 'package:carmagard/View/style.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> with Ui {
  String radioKey = '';
  List radioData = [
    {'text': 'As a user', 'asset': 'user'},
    {'text': 'As a Mechanic', 'asset': 'handyman'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: height(context) - 150,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   width: 259,
                  //   child: inputCenter(black30, 24,
                  //       'How will you be using the handy man app', w700),
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        radioData.length,
                        (index) => Padding(
                              padding: pSymmetric(12, 0),
                              child: Material(
                                borderRadius: borderR(10),
                                elevation: 5,
                                child: Container(
                                  width: width(context),
                                  padding: const EdgeInsets.all(14),
                                  height: 139,
                                  decoration: BoxDecoration(
                                      borderRadius: borderR(10), color: white),
                                  child: Row(
                                      mainAxisAlignment: mBtw,
                                      crossAxisAlignment: cStart,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/${radioData[index]['asset']}.svg'),
                                        Padding(
                                          padding: pSymmetric(0, 6),
                                          child: Center(
                                              child: input(
                                                  blackc1,
                                                  20,
                                                  radioData[index]['text'],
                                                  w700)),
                                        ),
                                        Flexible(
                                          child: Radio<String>(
                                              activeColor: green,
                                              value: radioData[index]['text'],
                                              groupValue: radioKey,
                                              onChanged: (val) {
                                                setState(() {
                                                  radioKey = val!;
                                                });
                                              }),
                                        )
                                      ]),
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      nav(context, const CreateAccountHandyman());
                    },
                    child: button(commonText('Next', white), green)),
                GestureDetector(
                  onTap: () {
                    nav(context, const LoginScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      input(black30, 16, 'Already have an account? ', w400),
                      input(green, 16, 'Log in', w400),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
