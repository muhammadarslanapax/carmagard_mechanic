import 'package:flutter/material.dart';
import 'package:carmagard/View/setlocation3.dart';
import 'package:carmagard/View/style.dart';

class SetLocation2 extends StatefulWidget {
  const SetLocation2({super.key});

  @override
  State<SetLocation2> createState() => _SetLocation2State();
}

class _SetLocation2State extends State<SetLocation2> with Ui {
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
                elevation: 1,
                child: Container(
                  width: width(context),
                  height: 240,
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
                      input(black, 16, 'How urgent is this request?', w700),
                      hspacer(5),
                      input(
                          grey61,
                          12,
                          'Your reply about the urgency helps us accelerate the required assistance process.',
                          w500),
                      hspacer(40),
                      GestureDetector(
                        onTap: () {
                          nav(context, const SetLocation3());
                        },
                        child: button(
                            Row(
                              children: [
                                Icon(
                                  Icons.safety_check,
                                  color: white,
                                  size: 20,
                                ),
                                wspacer(10),
                                input(white, 14, 'Instant', w500),
                              ],
                            ),
                            green),
                      ),
                      hspacer(10),
                      button(
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: white,
                                size: 20,
                              ),
                              wspacer(10),
                              input(white, 14, 'Schedule', w500),
                            ],
                          ),
                          grey3c.withOpacity(0.5))
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
