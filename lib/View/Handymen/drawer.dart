// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/Handymen/accountdetail.dart';
import 'package:carmagard/View/style.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> with Ui {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: cStart,
                children: [
                  GestureDetector(
                      onTap: () {
                        popBack(context);
                      },
                      child: SvgPicture.asset('assets/cancel2.svg')),
                  hspacer(25),
                  SvgPicture.asset('assets/user1.svg'),
                  input(Color(0xff434B47), 18, 'Username', w700),
                  smallText('emailaddress@gmail.com'),
                  Divider(),
                  Builder(builder: (context) {
                    List data = [
                      {
                        'icon': 'account-circle',
                        'text': 'Profile',
                      },
                      {
                        'icon': 'notifications',
                        'text': 'Notification',
                      },
                      {
                        'icon': 'book',
                        'text': 'Bookings',
                      },
                      {
                        'icon': 'help',
                        'text': 'Account Details',
                      }
                    ];
                    return Column(
                      children: List.generate(
                          data.length,
                          (index) => Padding(
                                padding: pSymmetric(16, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (index == 3) {
                                      nav(context, AccountDetail());
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/${data[index]['icon']}.svg'),
                                      wspacer(11),
                                      input(
                                          black, 16, data[index]['text'], w400),
                                      const Spacer(),
                                      SvgPicture.asset(
                                          'assets/arrow-back-ios.svg'),
                                    ],
                                  ),
                                ),
                              )),
                    );
                  })
                ],
              )),
        ),
      ),
    );
  }
}
