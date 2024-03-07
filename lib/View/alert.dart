import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/Handymen/acceptbooking.dart';
import 'package:carmagard/View/Handymen/location.dart';
import 'package:carmagard/View/arrive.dart';
import 'package:carmagard/View/setlocation.dart';
import 'package:carmagard/View/style.dart';

class AlertWidget with Ui {
  Future chooseModel(
    BuildContext context,
  ) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        )),
        builder: (context) {
          return Builder(builder: (context) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    // crossAxisAlignment: cStart,
                    children: [
                      GestureDetector(
                        onTap: () {
                          nav(context, const ArriveScreen());
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(borderRadius: borderR(50)),
                          child: ClipRRect(
                            borderRadius: borderR(50),
                            child: SvgPicture.asset('assets/3.svg'),
                          ),
                        ),
                      ),
                      input(black, 16, 'Jonathan Parker', w700),
                      input(black, 14, 'Electrician', w700),
                      Builder(builder: (context) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                2,
                                (index) => Padding(
                                      padding: pSymmetric(10, 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          chat(context);
                                        },
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
                                                  ? 'assets/message.svg'
                                                  : 'assets/call.svg'),
                                            ),
                                            input(
                                                black,
                                                14,
                                                index == 0 ? "Chat" : 'Call',
                                                w500)
                                          ],
                                        ),
                                      ),
                                    )));
                      }),
                      hspacer(10),
                      GestureDetector(
                          onTap: () {
                            nav(context, const SetLocation());
                          },
                          child:
                              button(commonText('Book Service', white), green))
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  Future acceptBooking(
    BuildContext context,
  ) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        )),
        builder: (context) {
          return Builder(builder: (context) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    // crossAxisAlignment: cStart,
                    children: [
                      GestureDetector(
                        onTap: () {
                          nav(context, const Location());
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(borderRadius: borderR(50)),
                          child: ClipRRect(
                            borderRadius: borderR(50),
                            child: SvgPicture.asset('assets/3.svg'),
                          ),
                        ),
                      ),
                      input(black, 16, 'Jonathan Ade', w700),
                      Builder(builder: (context) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                2,
                                (index) => Padding(
                                      padding: pSymmetric(10, 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          chat(context);
                                        },
                                        child: Column(
                                          children: [
                                            Material(
                                              elevation: 2,
                                              borderRadius: borderR(22),
                                              child: Container(
                                                width: 44,
                                                height: 44,
                                                alignment: center,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: white),
                                                child: SvgPicture.asset(
                                                    index == 1
                                                        ? 'assets/chat2.svg'
                                                        : 'assets/call2.svg'),
                                              ),
                                            ),
                                            hspacer(4),
                                            input(
                                                black,
                                                14,
                                                index == 1 ? "Chat" : 'Call',
                                                w500)
                                          ],
                                        ),
                                      ),
                                    )));
                      }),
                      hspacer(32),
                      Padding(
                        padding: pSymmetric(10, 0),
                        child: Column(
                          crossAxisAlignment: cStart,
                          children: [
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: smallText('Car Model')),
                            input(black, 12, 'Benz GLE ', w500),
                          ],
                        ),
                      ),
                      Padding(
                        padding: pSymmetric(10, 0),
                        child: Column(
                          crossAxisAlignment: cStart,
                          children: [
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: smallText('Description')),
                            input(
                                black,
                                12,
                                'Soft or Spongy Brakes: May signal air or moisture in the brake lines, worn brake pads, or a failing master cylinder',
                                w500),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: smallText('Destination')),
                      Row(
                        children: [
                          SvgPicture.asset('assets/location.svg'),
                          wspacer(3),
                          input(black, 12, 'Street name, Ajah', w500),
                        ],
                      ),
                      hspacer(32),
                      GestureDetector(
                          onTap: () {
                            nav(context, const AcceptBooking());
                          },
                          child: button(commonText('Accept', white), green))
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  Future chat(
    BuildContext context,
  ) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        )),
        builder: (context) {
          return Builder(builder: (context) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: cStart,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            popBack(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 18,
                          ),
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          margin: pSymmetric(0, 10),
                          decoration: BoxDecoration(borderRadius: borderR(18)),
                          child: ClipRRect(
                            borderRadius: borderR(18),
                            child: SvgPicture.asset('assets/3.svg'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            nav(context, const ArriveScreen());
                          },
                          child: Column(
                            crossAxisAlignment: cStart,
                            children: [
                              input(black, 16, 'Jonathan Parker', w700),
                              input(const Color(0xffBFBFBF), 12, 'Electrician',
                                  w700),
                            ],
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset('assets/call2.svg')
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: cStart,
                      children: [
                        input(
                            black, 12, 'Start conversion with Jonathan', w500),
                        Wrap(
                          children: [
                            Container(
                              padding: pSymmetric(9, 12),
                              margin: pSymmetric(10, 10),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(0),
                                  ),
                                  color: green.withOpacity(0.7)),
                              child: input(
                                  const Color(0xff2E2E2E), 16, 'Hello', w400),
                            )
                          ],
                        ),
                        hspacer(25),
                        Container(
                          padding: pSymmetric(14, 10),
                          decoration: BoxDecoration(
                              borderRadius: borderR(20),
                              color: const Color(0xffF7F7F7)),
                          child: Row(children: [
                            input(const Color(0xff747979), 14,
                                "Type your message", w400),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  nav(context, const ArriveScreen());
                                },
                                child: SvgPicture.asset(
                                  'assets/send.svg',
                                  color: green,
                                ))
                          ]),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  Future rating(context) {
    return showGeneralDialog(
        context: context,
        pageBuilder:
            (context, Animation animation, Animation secondaryAnimation) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.cancel_rounded,
                            color: black,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future endBooking(context) {
    return showGeneralDialog(
        context: context,
        pageBuilder:
            (context, Animation animation, Animation secondaryAnimation) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: SizedBox(
              height: 210,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    inputCenter(
                        black,
                        16,
                        'Are you sure you want to mark this job as completed?',
                        w500),
                    Padding(
                      padding: pSymmetric(24, 0),
                      child: button(commonText('End booking', white), green),
                    ),
                    GestureDetector(
                        onTap: () {
                          popBack(context);
                        },
                        child: input(Colors.red, 16, 'Cancel Booking', w500))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
