import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/style.dart';

class ArriveScreen extends StatefulWidget {
  const ArriveScreen({super.key});

  @override
  State<ArriveScreen> createState() => _ArriveScreenState();
}

class _ArriveScreenState extends State<ArriveScreen> with Ui {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            height: height(context) / 1.5,
            alignment: center,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/map.png'), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: cStart,
              children: [
                input(black, 22, 'Arriving in 6 mins', w700),
                Row(
                  mainAxisAlignment: mBtw,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: pSymmetric(10, 20),
                            child: Column(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  alignment: center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffF3F3F5)),
                                  child: SvgPicture.asset(index == 0
                                      ? 'assets/3.svg'
                                      : index == 1
                                          ? "assets/message.svg"
                                          : 'assets/call.svg'),
                                ),
                                input(black, 14, index == 1 ? "Chat" : 'Call',
                                    w500)
                              ],
                            ),
                          )),
                ),
                Builder(builder: (context) {
                  List data = [
                    {
                      'text': 'Coming from',
                      'sub': 'Street name, Ajah',
                    },
                    {
                      'text': 'Destination',
                      'sub': 'Lateef Jakande Road',
                    },
                  ];
                  return Column(
                    children: List.generate(
                        data.length,
                        (index) => Padding(
                              padding: pSymmetric(10, 0),
                              child: Column(
                                crossAxisAlignment: cStart,
                                children: [
                                  input(const Color(0xffBFBFBF), 12,
                                      data[index]['text'], w500),
                                  hspacer(10),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/location.svg'),
                                      wspacer(11),
                                      input(
                                          black, 16, data[index]['sub'], w400),
                                      const Spacer(),
                                      Visibility(
                                        visible: index == 1,
                                        child:
                                            SvgPicture.asset('assets/edit.svg'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                  );
                }),
                Padding(
                  padding: pSymmetric(18, 0),
                  child: const Divider(),
                ),
                Padding(
                  padding: pSymmetric(0, 0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/cancel.svg'),
                      wspacer(11),
                      input(black, 16, 'Cancel Request', w400),
                      const Spacer(),
                      SvgPicture.asset('assets/arrow-back-ios.svg'),
                    ],
                  ),
                ),
                hspacer(27),
                Row(
                  children: [
                    SvgPicture.asset('assets/share.svg'),
                    wspacer(11),
                    input(black, 16, 'Share Location', w400),
                    const Spacer(),
                    SvgPicture.asset('assets/arrow-back-ios.svg'),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
