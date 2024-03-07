import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/style.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> with Ui {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: cStart,
          children: [
            header('My Account Information', context),
            hspacer(33),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/3.svg',
                  width: 44,
                  height: 44,
                ),
                wspacer(5),
                input(black, 16, 'Jonathan Parker', w700),
                const Spacer(),
                // Builder(builder: (context) {
                //   return Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: List.generate(
                //           2,
                //           (index) => Padding(
                //                 padding: pSymmetric(0, 0),
                //                 child: GestureDetector(
                //                   onTap: () {
                //                     // chat(context);
                //                   },
                //                   child: Column(
                //                     children: [
                //                       Container(
                //                         width: 44,
                //                         height: 44,
                //                         margin: const EdgeInsets.only(left: 15),
                //                         alignment: center,
                //                         decoration: const BoxDecoration(
                //                             shape: BoxShape.circle,
                //                             color: Color(0xffF3F3F5)),
                //                         child: SvgPicture.asset(index == 0
                //                             ? 'assets/message.svg'
                //                             : 'assets/call.svg'),
                //                       ),
                //                       input(black, 14,
                //                           index == 0 ? "Chat" : 'Call', w500)
                //                     ],
                //                   ),
                //                 ),
                //               )));
                // }),
              ],
            ),
            hspacer(34),
            Row(
              children: [
                input(black1f, 20, 'Vehicle Details', w500),
                wspacer(18),
                // button(commonText('About to begin', white),
                //     const Color(0xffFAE9B7))
              ],
            ),
            Builder(builder: (context) {
              List data = [
                {'text': 'Location', 'sub': 'Adeyemi Adeboye'},
                {'text': 'Service required', 'sub': 'Electrical services'},
                {'text': 'Agreed price', 'sub': '10000'},
              ];
              List car = [
                {'make': 'Toyota', 'model': 'Camry', 'year': 2018},
                {'make': 'Honda', 'model': 'Civic', 'year': 2020},
                // {'make': 'Ford', 'model': 'F-150', 'year': 2019},
                // {'make': 'Chevrolet', 'model': 'Malibu', 'year': 2022}
              ];
              return Column(
                crossAxisAlignment: cStart,
                children: List.generate(
                    car.length,
                    (index) => Padding(
                          padding: pSymmetric(16, 0),
                          child: Row(
                            children: [
                              smallText(car[index]['make'] +
                                  " (${(car[index]['model'])})"),
                              const Spacer(),
                              input(black, 14, car[index]['year'].toString(),
                                  w700)
                            ],
                          ),
                        )),
              );
            }),
            hspacer(40),
            // FormWidget(inputText: 'email', text: "Email add", context: context).textField()
            // input(const Color(0xff7A7878), 14, "Handyman's account details",
            //     w700),
            // Builder(builder: (context) {
            //   List data = [
            //     {'text': 'Account Number', 'sub': '123456777'},
            //     {'text': 'Bank', 'sub': 'Ade Bank'},
            //     {'text': 'Account Name', 'sub': 'Jonathan Parker'},
            //   ];
            //   return Column(
            //     crossAxisAlignment: cStart,
            //     children: List.generate(
            //         data.length,
            //         (index) => Padding(
            //               padding: pSymmetric(16, 0),
            //               child: Row(
            //                 children: [
            //                   smallText(data[index]['text']),
            //                   const Spacer(),
            //                   input(black, 14, data[index]['sub'], w700)
            //                 ],
            //               ),
            //             )),
            //   );
            // }),
            hspacer(35),
            button(commonText('Update profile', white), green),
            // Padding(
            //   padding: pSymmetric(30, 0),
            //   child: Center(
            //       child: input(
            //           const Color(0xffEB5757), 14, 'Cancel booking', w700)),
            // )
          ],
        ),
      )),
    );
  }
}
