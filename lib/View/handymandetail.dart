import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carmagard/View/alert.dart';
import 'package:carmagard/View/style.dart';

class HandyDetail extends StatefulWidget {
  const HandyDetail({super.key});

  @override
  State<HandyDetail> createState() => _HandyDetailState();
}

class _HandyDetailState extends State<HandyDetail> with Ui {
  DateTime todayTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: cStart,
              children: [
                header(' ', context),
                Padding(
                  padding: pSymmetric(0, 10),
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/2.png',
                      width: width(context),
                      height: 200,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                hspacer(20),
                input(black, 16, 'Jonathan Parker', w500),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => SvgPicture.asset(
                          'assets/star-rate.svg',
                          color: index == 0 ? yellow00 : greyB5,
                        ),
                      ),
                    ),
                    input(greyB5, 12, '(30 reviews)', w400)
                  ],
                ),
                hspacer(18),
                Row(
                  children: [
                    Container(
                      padding: pSymmetric(8, 16),
                      decoration: BoxDecoration(
                          color: const Color(0xff18a974).withOpacity(0.15)),
                      child: commonText('Mechanic', grey3c),
                    ),
                    wspacer(16),
                    Container(
                      padding: pSymmetric(8, 16),
                      decoration: BoxDecoration(
                          color: const Color(0xff18a974).withOpacity(0.15)),
                      child: commonText('Car repair', grey3c),
                    )
                  ],
                ),
                hspacer(40),
                input(
                    grey3c,
                    14,
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In egestas erat imperdiet sed euismod nisi. Id eu nisl nunc mi ',
                    w400),
                GestureDetector(
                  onTap: () {
                    AlertWidget().chooseModel(context);
                  },
                  child: Padding(
                    padding: pSymmetric(24, 0),
                    child: button(commonText('Talk to Mechanic', white), green),
                  ),
                ),
                inputCenter(black, 16, 'Reviews', w500),
                Container(
                  width: width(context),
                  padding: pSymmetric(12, 16),
                  child: Column(
                    crossAxisAlignment: cStart,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/review.png'),
                          input(black, 16, 'Kate Bush', w400),
                          const Spacer(),
                          Row(
                            children: List.generate(
                                5,
                                (index) =>
                                    SvgPicture.asset('assets/star-rate.svg')),
                          )
                        ],
                      ),
                      input(black, 16, 'He arrived on time', w700),
                      input(
                          grey3c,
                          14,
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In egestas erat imperdiet sed euismod nisi. Id eu nisl nunc mi ipsum faucibus ',
                          w400),
                    ],
                  ),
                ),
                viewAllRow('Similar Mechanic', 'See all'),
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
                                              color: green,
                                              shape: BoxShape.circle),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                wspacer(17),
                                Column(
                                  crossAxisAlignment: cStart,
                                  children: [
                                    input(const Color(0xff333333), 16,
                                        'Mechanic', w700),
                                    Row(
                                      children: [
                                        input(const Color(0xff888888), 14,
                                            'Scott Fredrick', w400),
                                        SvgPicture.asset(
                                            'assets/location-on.svg'),
                                        input(const Color(0xffBDBDBD), 12,
                                            'No 2 Victoria', w400),
                                      ],
                                    ),
                                    hspacer(5),
                                    Row(
                                      children: [
                                        input(const Color(0xffBDBDBD), 12, '3',
                                            w400),
                                        SvgPicture.asset(
                                            'assets/star-rate.svg'),
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
          ),
        ),
      )),
    );
  }
}
