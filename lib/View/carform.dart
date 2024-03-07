import 'package:flutter/material.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/setlocation4.dart';
import 'package:carmagard/View/style.dart';

class CarForm extends StatefulWidget {
  const CarForm({super.key});

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> with Ui {
  FormWidget? carIssue;
  FormWidget? carLocation;
  FormWidget? carYear;
  FormWidget? carModel;
  FormWidget? carMake;
  String description = '';

  @override
  void initState() {
    super.initState();
    carIssue = FormWidget(
        inputText: '', text: 'Which Service you do want?', context: context);
    carLocation = FormWidget(inputText: '', text: '', context: context);
    carModel = FormWidget(inputText: '', text: 'Model', context: context);
    carMake = FormWidget(inputText: '', text: 'Maker', context: context);
    carYear = FormWidget(inputText: '', text: 'Year', context: context);
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: cStart,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        hspacer(15),
                        input(black, 16, 'Vehicle Details', w700),
                        hspacer(5),
                        input(grey61, 12, 'Please fill your vehicle detail',
                            w500),
                        hspacer(40),
                        carIssue!.dropdown(context),
                        carModel!.dropdown(context),
                        carMake!.dropdown(context),
                        carYear!.dropdown(context),
                        // carLocation!.dropdown(context),
                        hspacer(10),
                        // input(grey61, 12, 'Description', w700),
                        // hspacer(5),
                        // Container(
                        //   width: width(context),
                        //   height: 54 * 2,
                        //   alignment: left,
                        //   padding: const EdgeInsets.all(12),
                        //   decoration: BoxDecoration(
                        //       borderRadius: borderR(8),
                        //       border: Border.all(
                        //         color: const Color(0xffD5D5D5),
                        //         width: 1,
                        //       )),
                        //   child: const TextField(
                        //     maxLines: 3,
                        //     // onChanged: (val) {
                        //     //   inputText = val;
                        //     // },
                        //     // keyboardType: keyboard ?? TextInputType.name,
                        //     decoration: InputDecoration(
                        //       // suffix: Icon(Icons.remove_red_eye),
                        //       // labelText: 'Email address',
                        //       border: InputBorder.none,
                        //       labelStyle: TextStyle(color: Colors.grey),
                        //       // errorText: validmail(email),
                        //     ),
                        //   ),
                        // ),

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
              ),
            )
          ],
        ),
      )),
    );
  }
}
