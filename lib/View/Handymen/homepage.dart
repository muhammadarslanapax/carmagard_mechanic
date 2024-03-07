import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/Handymen/commonwidget.dart';
import 'package:carmagard/View/Handymen/drawer.dart';
import 'package:carmagard/View/alert.dart';
import 'package:carmagard/View/style.dart';

class HandyManHomepage extends StatefulWidget {
  const HandyManHomepage({super.key});

  @override
  State<HandyManHomepage> createState() => _HandyManHomepageState();
}

class _HandyManHomepageState extends State<HandyManHomepage>
    with Ui, CommonWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerView(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: SvgPicture.asset('assets/menu.svg')),
                    const Spacer(),
                    SvgPicture.asset('assets/notifications.svg'),
                    wspacer(24),
                    SvgPicture.asset('assets/account-circle.svg'),
                  ],
                ),
                Container(
                  width: width(context),
                  padding: pSymmetric(14, 16),
                  margin: pSymmetric(24, 0),
                  decoration: BoxDecoration(
                      borderRadius: borderR(8), color: const Color(0xfff6f6f6)),
                  child: Row(children: [
                    SvgPicture.asset('assets/search.svg'),
                    wspacer(10),
                    smallText('Search')
                  ]),
                ),
                Padding(
                  padding: pSymmetric(10, 0),
                  child: Material(
                    elevation: 1,
                    borderRadius: borderR(8),
                    child: Container(
                      width: width(context),
                      padding: pSymmetric(16, 16),
                      margin: pSymmetric(24, 0),
                      decoration: BoxDecoration(
                          borderRadius: borderR(8),
                          color: const Color(0xfff6f6f6)),
                      child: Column(
                        crossAxisAlignment: cStart,
                        children: [
                          Row(children: [
                            SvgPicture.asset('assets/user3.svg'),
                            wspacer(10),
                            Column(
                              crossAxisAlignment: cStart,
                              children: [
                                input(black, 16, 'Jane Ade', w700),
                                hspacer(10),
                                // input(black, 14, 'CarmaGard ', w400),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/location.svg'),
                                    wspacer(3),
                                    smallText('Street name, Ajah market'),
                                  ],
                                ),
                              ],
                            )
                          ]),
                          hspacer(20),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  AlertWidget().acceptBooking(context);
                                },
                                child: SizedBox(
                                    width: (width(context) - 95) / 2,
                                    child: button(
                                        commonText('View Request', white),
                                        green)),
                              ),
                              const Spacer(),
                              SizedBox(
                                  width: (width(context) - 95) / 2,
                                  child: buttonOutLine(
                                      commonText('Reject', green)))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                    children:
                        List.generate(5, (index) => booking(context, true)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
