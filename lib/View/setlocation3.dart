import 'package:flutter/material.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/setlocation4.dart';
import 'package:carmagard/View/style.dart';

class SetLocation3 extends StatefulWidget {
  const SetLocation3({super.key});

  @override
  State<SetLocation3> createState() => _SetLocation3State();
}

class _SetLocation3State extends State<SetLocation3> with Ui {
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
              height: (height(context)) / 2,
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
                  height: height(context) / 1.7,
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
                      input(black, 16, 'Tell us about your car issue?', w700),
                      hspacer(5),
                      input(
                          grey61,
                          12,
                          'Your reply enable us to provide necassary assistance',
                          w500),
                      hspacer(40),
                      carService!.dropdown(context),
                      hspacer(10),
                      input(grey61, 12, 'Description', w700),
                      hspacer(5),
                      Container(
                        width: width(context),
                        height: 54 * 2,
                        alignment: left,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: borderR(8),
                            border: Border.all(
                              color: const Color(0xffD5D5D5),
                              width: 1,
                            )),
                        child: const TextField(
                          maxLines: 3,
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
                      hspacer(20),
                      GestureDetector(
                          onTap: () {
                            nav(context, const SetLocation4());
                          },
                          child: button(
                              input(white, 14, 'Request Mechanic', w500),
                              green))
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
