import 'package:carmagard/View/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GpsScreen extends StatefulWidget {
  const GpsScreen({super.key});

  @override
  State<GpsScreen> createState() => _GpsScreenState();
}

class _GpsScreenState extends State<GpsScreen> with Ui {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height(context) / 1,
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
      ),
    );
  }
}
