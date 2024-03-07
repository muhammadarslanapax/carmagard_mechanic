import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carmagard/View/style.dart';

mixin CommonWidget on Ui {
  Widget earning() => Padding(
        padding: pSymmetric(5, 5),
        child: Column(
          crossAxisAlignment: cStart,
          children: [
            hspacer(10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: cStart,
                  children: [
                    smallText('Today'),
                    input(green, 32, 'N25000', w700)
                  ],
                ),
                const Spacer(),
                Container(
                  alignment: center,
                  padding: const EdgeInsets.fromLTRB(0.5, 6.5, 1.75, 5),
                  decoration: BoxDecoration(
                      color: const Color(0xffE3F8EE),
                      borderRadius: borderR(12.5)),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/chart.svg'),
                      input(green, 13, '+2.0', w500),
                    ],
                  ),
                )
              ],
            ),
            const Divider(),
          ],
        ),
      );

  Widget rating(context) {
    return StatefulBuilder(builder: (context, innerState) {
      int tab = 0;
      return Column(
        crossAxisAlignment: cStart,
        children: [
          Padding(
            padding: pSymmetric(16, 0),
            child: input(black, 16, 'Review summary', w700),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: cStart,
                children: [
                  input(black, 36, '4.4', w700),
                  Row(
                    children: List.generate(
                        5, (index) => SvgPicture.asset('assets/star.svg')),
                  ),
                  input(black, 12, '73 reviews', w500),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: cStart,
                children: List.generate(
                    5,
                    (index) => Padding(
                          padding: pSymmetric(6, 0),
                          child: Row(
                            children: [
                              input(const Color(0xff787878), 12, '${index + 1}',
                                  w400),
                              wspacer(10),
                              Container(
                                height: 8,
                                alignment: left,
                                width: ((width(context) - 32) / 2),
                                decoration: BoxDecoration(
                                    borderRadius: borderR(4),
                                    color: const Color(0xfffafafa)),
                                child: Container(
                                  height: 8,
                                  width: ((width(context) - 32) / 2) *
                                      ((index + 1) / 5),
                                  decoration: BoxDecoration(
                                      borderRadius: borderR(4),
                                      color: yellow00),
                                ),
                              )
                            ],
                          ),
                        )).reversed.toList(),
              )
            ],
          ),
          SizedBox(
            height: 165,
            child: PageView.builder(
                itemCount: 4,
                onPageChanged: (c) {
                  innerState(() {
                    tab = c;
                  });
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: pSymmetric(5, 2),
                    child: Material(
                      elevation: 1,
                      color: white,
                      borderRadius: borderR(16),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: borderR(16), color: white),
                        width: width(context),
                        padding: pSymmetric(12, 16),
                        child: Column(
                          crossAxisAlignment: cStart,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/review.png'),
                                wspacer(10),
                                input(black, 16, 'Kate Bush', w400),
                                const Spacer(),
                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => SvgPicture.asset(
                                          'assets/star-rate.svg')),
                                )
                              ],
                            ),
                            hspacer(5),
                            input(black, 16, 'He arrived on time', w700),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In egestas erat imperdiet sed euismod nisi. Id eu nisl nunc mi ipsum faucibus ',
                              maxLines: 3,
                              style: TextStyle(
                                  fontWeight: w400,
                                  fontSize: 14,
                                  color: grey3c,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            /*      input(
                                grey3c,
                                14,
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In egestas erat imperdiet sed euismod nisi. Id eu nisl nunc mi ipsum faucibus ',
                                w400),*/
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          hspacer(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => Container(
                      margin: pSymmetric(0, 4),
                      height: 6,
                      width: tab == index ? 12 : 6,
                      decoration: BoxDecoration(
                          borderRadius: borderR(8),
                          color:
                              index == tab ? green : const Color(0xff787878)),
                    )),
          )
        ],
      );
    });
  }

  Widget booking(context, bool t) {
    return Padding(
      padding: pSymmetric(10, 0),
      child: Material(
        elevation: 1,
        borderRadius: borderR(8),
        color: t ? const Color(0xfff6f6f6) : white,
        child: Container(
          width: width(context),
          padding: pSymmetric(16, 16),
          margin: pSymmetric(24, 0),
          decoration: BoxDecoration(
              borderRadius: borderR(8),
              color: t ? const Color(0xfff6f6f6) : white),
          child: Column(
            crossAxisAlignment: cStart,
            children: [
              Row(children: [
                SvgPicture.asset('assets/user1.svg'),
                wspacer(10),
                Column(
                  crossAxisAlignment: cStart,
                  children: [
                    input(black, 16, 'Jane Ade', w700),
                    hspacer(10),
                    Row(
                      children: [
                        SvgPicture.asset('assets/location.svg'),
                        wspacer(3),
                        smallText('Street name,Ajah'),
                      ],
                    ),
                    smallText('25/03/2023'),
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
