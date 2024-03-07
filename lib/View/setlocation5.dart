import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/style.dart';

class SetLocation5 extends StatefulWidget {
  const SetLocation5({super.key});

  @override
  State<SetLocation5> createState() => _SetLocation5State();
}

class _SetLocation5State extends State<SetLocation5> with Ui {
  FormWidget? carService;
  String description = '';

  @override
  void initState() {
    super.initState();
    carService = FormWidget(
        inputText: '', text: 'Which car require service?', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: height(context),
        child: Stack(
          // crossAxisAlignment: cStart,
          children: [
            Container(
              height: (height(context)),
              alignment: center,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/map.png'), fit: BoxFit.cover)),
              child: Column(crossAxisAlignment: cStart, children: const []),
            ),
            Positioned(
              bottom: 0,
              child: Material(
                color: white,
                child: Container(
                  width: width(context),
                  padding: pSymmetric(10, 20),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: borderUpper(40),
                  ),
                  child: Column(
                    crossAxisAlignment: cStart,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      hspacer(15),
                      input(black, 16, "We've found a match for you!", w700),
                      hspacer(5),
                      input(
                          grey61,
                          12,
                          'Rely on our system to determine the nearest avallable mechanic, so you can get back on the road faster.',
                          w500),
                      hspacer(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: cStart,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: grey3c.withOpacity(0.5)),
                          ),
                          wspacer(10),
                          Column(
                            crossAxisAlignment: cStart,
                            children: [
                              input(black, 14, 'Billy Joe', w500),
                              hspacer(7),
                              Builder(builder: (context) {
                                List d = ['Ford', "Toyota", "Telsa"];
                                return Row(
                                  children: List.generate(
                                      d.length,
                                      (index) => Container(
                                            padding: pSymmetric(5, 10),
                                            margin:
                                                const EdgeInsets.only(right: 7),
                                            decoration: BoxDecoration(
                                                color: green.withOpacity(0.5),
                                                borderRadius: borderR(13)),
                                            child: input(
                                                black, 12, d[index], w500),
                                          )),
                                );
                              }),
                            ],
                          ),
                          const Spacer(),
                          input(grey3c, 12, '20 miles away', w400)
                        ],
                      ),
                      hspacer(15),
                      Builder(builder: (context) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                2,
                                (index) => Flexible(
                                      child: Padding(
                                        padding: pSymmetric(10, 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            // chat(context);
                                          },
                                          child: Column(
                                            children: [
                                              Material(
                                                borderRadius: borderR(22),
                                                child: Container(
                                                  padding: pSymmetric(10, 30),
                                                  alignment: center,
                                                  decoration: BoxDecoration(
                                                      color: index == 0
                                                          ? green
                                                          : grey3c.withOpacity(
                                                              0.5)),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        index == 0
                                                            ? 'assets/chat2.svg'
                                                            : 'assets/call2.svg',
                                                        color: white,
                                                      ),
                                                      wspacer(15),
                                                      input(
                                                          white,
                                                          14,
                                                          index == 0
                                                              ? "Chat"
                                                              : 'Call',
                                                          w500)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )));
                      }),
                      hspacer(40),
                      Row(
                        children: [
                          const Icon(Icons.cancel, color: Colors.red, size: 20),
                          wspacer(10),
                          input(grey3c, 14, 'Cancel Request', w500)
                        ],
                      )
                    ],
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
