import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/style.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> with Ui {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: cStart,
        children: [
          header('Select Category', context),
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
          ),
        ],
      )),
    );
  }
}
