import 'package:flutter/material.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/setlocation5.dart';
import 'package:carmagard/View/style.dart';

class SetLocation4 extends StatefulWidget {
  const SetLocation4({super.key});

  @override
  State<SetLocation4> createState() => _SetLocation4State();
}

class _SetLocation4State extends State<SetLocation4> with Ui {
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
                elevation: 1,
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
                      input(
                          black,
                          16,
                          'Matching you with the nearest available mechanic',
                          w700),
                      hspacer(5),
                      input(
                          grey61,
                          12,
                          'Rely on our system to determine the nearest avallable mechanic, so you can get back on the road faster.',
                          w500),
                      hspacer(40),
                      GestureDetector(
                          onTap: () {
                            nav(context, const SetLocation5());
                          },
                          child: input(grey61, 12, 'Current Location', w700)),
                      hspacer(5),
                      Container(
                        width: width(context),
                        height: 54,
                        alignment: left,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: borderR(8),
                            border: Border.all(
                              color: const Color(0xffD5D5D5),
                              width: 1,
                            )),
                        child: const TextField(
                          maxLines: 1,
                          // onChanged: (val) {
                          //   inputText = val;
                          // },
                          // keyboardType: keyboard ?? TextInputType.name,
                          decoration: InputDecoration(
                            // suffix: Icon(Icons.remove_red_eye),
                            // labelText: 'Email address',
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.grey),
                            // errorText: validmail(email),
                          ),
                        ),
                      ),
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
