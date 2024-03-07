import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carmagard/View/style.dart';

import 'commonwidget.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({super.key});

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> with Ui, CommonWidget {
  List data = [
    {
      'name': 'All',
      'color': const Color(0xff18A974),
    },
    {
      'name': 'Mechanic',
      'color': const Color(0xffE3F3FD),
    },
    {
      'name': 'Photographer',
      'color': const Color(0xffFFE7DF),
    },
    {
      'name': 'Mechanic',
      'color': const Color(0xffE3F3FD),
    },
  ];
  bool offline = false;
  int tab = 0;
  int tab2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: cStart,
          children: [
            Container(
              height: height(context) / 1.5,
              alignment: center,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/map.png'), fit: BoxFit.cover)),
              child: Column(crossAxisAlignment: cStart, children: [
                Material(
                  elevation: 2,
                  color: white,
                  borderRadius: borderR(20),
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: center,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SvgPicture.asset('assets/menu.svg'),
                  ),
                ),
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
                    input(grey61, 14, 'Search', w400)
                  ]),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: cStart,
                children: [
                  Padding(
                    padding: pSymmetric(15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        input(black, 14, "Go Offline", w700),
                        CupertinoSwitch(
                          value: offline,
                          onChanged: (c) {
                            setState(() {
                              offline = c;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width(context),
                    padding: pSymmetric(12, 12),
                    decoration: BoxDecoration(
                        borderRadius: borderR(20),
                        color: const Color(0xffF3F3F3)),
                    child: Row(
                      mainAxisAlignment: mBtw,
                      children: List.generate(4, (index) {
                        List data = [
                          'Earnings',
                          'Rating',
                          'Bookings',
                          'Statistics'
                        ];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              tab = index;
                            });
                          },
                          child: Container(
                            alignment: center,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: tab != index
                                    ? const Color(0xffF3F3F3)
                                    : white,
                                borderRadius: borderR(16)),
                            child: input(black, 12, data[index], w500),
                          ),
                        );
                      }),
                    ),
                  ),
                  tab == 0
                      ? Column(
                          crossAxisAlignment: cStart,
                          children: List.generate(5, (index) => earning()),
                        )
                      : tab == 2
                          ? Column(
                              crossAxisAlignment: cStart,
                              children: List.generate(
                                  5, (index) => booking(context, false)),
                            )
                          : tab == 1
                              ? rating(context)
                              : Column(
                                  crossAxisAlignment: cStart,
                                  children: [
                                    hspacer(20),
                                    Row(
                                        mainAxisAlignment: mBtw,
                                        children: List.generate(4, (index) {
                                          List data = [
                                            'Last year',
                                            'Today',
                                            'Last week',
                                            'Last Month'
                                          ];
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                tab2 = index;
                                              });
                                            },
                                            child: Container(
                                              alignment: center,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: tab2 != index
                                                      ? const Color(0xffF3F3F3)
                                                      : black1f,
                                                  borderRadius: borderR(16)),
                                              child: input(
                                                  tab2 == index ? white : black,
                                                  14,
                                                  data[index],
                                                  w500),
                                            ),
                                          );
                                        })),
                                    hspacer(20),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            top: BorderSide.none,
                                            left: BorderSide.none,
                                            right: BorderSide(
                                                width: 1,
                                                color: Color(0xffD9D9D9)),
                                            bottom: BorderSide.none,
                                          )),
                                          child: Column(
                                            children: List.generate(
                                                7,
                                                (index) => Padding(
                                                      padding:
                                                          pSymmetric(10, 0),
                                                      child: input(
                                                          blackc1,
                                                          12,
                                                          '${(index + 1) * 10000}',
                                                          w500),
                                                    )),
                                          ),
                                        ),
                                        wspacer(10),
                                        Image.asset('assets/graph.png'),
                                      ],
                                    )
                                  ],
                                )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
