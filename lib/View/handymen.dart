import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/handymandetail.dart';
import 'package:carmagard/View/style.dart';

class HandyMen extends StatefulWidget {
  const HandyMen({super.key});

  @override
  State<HandyMen> createState() => _HandyMenState();
}

class _HandyMenState extends State<HandyMen> with Ui {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: cStart,
          children: [
            header('Select Category', context),
            Container(
              alignment: left,
              margin: pSymmetric(15, 0),
              width: width(context),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(color: Color.fromRGBO(96, 100, 112, 0.10))
              ], borderRadius: borderR(8), color: white),
              padding: pSymmetric(14, 16),
              child: Row(children: [
                SvgPicture.asset('assets/search.svg'),
                wspacer(10),
                input(grey61, 14, 'Search', w400),
              ]),
            ),
            Column(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: pSymmetric(10, 0),
                  child: GestureDetector(
                    onTap: () {
                      nav(context, const HandyDetail());
                    },
                    child: Material(
                      color: white,
                      elevation: 2,
                      borderRadius: borderR(14),
                      child: Container(
                        height: 92,
                        width: width(context),
                        alignment: center,
                        padding: const EdgeInsets.fromLTRB(14, 12, 0, 14),
                        decoration: BoxDecoration(
                            color: white, borderRadius: borderR(14)),
                        child: Row(
                          children: [
                            // ClipRRect(
                            //   borderRadius: borderR(15),
                            //   child: Image.asset(
                            //     'assets/handyman.png',
                            //     fit: BoxFit.fitHeight,
                            //     height: 80,
                            //     width: 80,
                            //   ),
                            // ),
                            SizedBox(
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 85,
                                    child: ClipRRect(
                                      borderRadius: borderR(12),
                                      child: Image.asset(
                                        'assets/handyman.png',
                                        fit: BoxFit.fitHeight,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 11,
                                      // margin: const EdgeInsets.only(right: 4),
                                      height: 11,
                                      decoration: BoxDecoration(
                                          color: green, shape: BoxShape.circle),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            wspacer(17),
                            Column(
                              crossAxisAlignment: cStart,
                              children: [
                                input(const Color(0xff333333), 16, 'Mechanic',
                                    w700),
                                Row(
                                  children: [
                                    input(const Color(0xff888888), 14,
                                        'Scott Fredrick', w400),
                                    SvgPicture.asset('assets/location-on.svg'),
                                    input(const Color(0xffBDBDBD), 12,
                                        'No 2 Victoria', w400),
                                  ],
                                ),
                                hspacer(5),
                                Row(
                                  children: [
                                    input(
                                        const Color(0xffBDBDBD), 12, '3', w400),
                                    SvgPicture.asset('assets/star-rate.svg'),
                                    input(const Color(0xffBDBDBD), 12,
                                        '(30 reviews)', w400),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
