import 'package:flutter/material.dart';
import 'package:carmagard/View/setlocation2.dart';
import 'package:carmagard/View/style.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> with Ui {
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
              height: height(context) / 2,
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
                  height: height(context) / 2,
                  padding: pSymmetric(10, 20),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: borderUpper(40),
                  ),
                  child: Column(
                    crossAxisAlignment: cStart,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Icon(
                        Icons.location_city,
                        size: 50,
                        color: green,
                      )),
                      hspacer(15),
                      Center(
                          child: inputCenter(
                              black,
                              16,
                              'Where would you like this service to take place?',
                              w700)),
                      hspacer(5),
                      Center(
                          child: inputCenter(
                              grey61,
                              12,
                              'Sharing your current location helps us pinpoint nearby mechanics who can promptly offer professional assistance within your proximity.',
                              w700)),
                      hspacer(40),
                      GestureDetector(
                        onTap: () {
                          nav(context, const SetLocation2());
                        },
                        child: button(
                            input(white, 14, 'Set automatically', w500), green),
                      ),
                      hspacer(10),
                      button(input(white, 14, 'Set later', w500),
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
