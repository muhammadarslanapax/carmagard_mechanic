import 'package:carmagard/View/style.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> with Ui {
  List data = [
    {
      'name': 'Essential',
      'subText': 'For the basics',
      'price': '9.99',
    },
    {
      'name': 'Recommended',
      'subText':
          'Perfect for those who want additional feature beyond the basics',
      'price': '19.99',
    },
    {
      'name': 'Pro',
      'subText':
          'comprehensive coverage for customers who want a worry-free driving experience.',
      'price': '29.99',
    }
  ];
  List feature = [
    'OBD-II diagnostics',
    'Basic Maintence alerts',
    'Per-per service model (e.g, oil changes,brakes)',
    'GPS-tracking',
    'Windshield washer fluid level monitoring',
    'Air-filter replacement alerts',
    'Roadside assistance',
    'Priority-service scheduling',
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return innnerLayout(Column(
      crossAxisAlignment: cStart,
      children: List.generate(
          3,
          (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: Builder(builder: (context) {
                  var check = selected == index;
                  return Container(
                    padding: pSymmetric(10, 10),
                    margin: pSymmetric(5, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: check ? green : grey3c.withOpacity(0.1)),
                      borderRadius: borderR(15),
                    ),
                    child: Column(
                      crossAxisAlignment: cStart,
                      children: [
                        Container(
                          width: width(context) - 30,
                          decoration: BoxDecoration(
                              borderRadius: borderR(12),
                              color: check ? green : white),
                          padding: pSymmetric(5, 10),
                          child: Column(
                            crossAxisAlignment: cStart,
                            children: [
                              Center(
                                child: input(check ? white : black, 18,
                                    data[index]['name'], w500),
                              ),
                              hspacer(5),
                              Center(
                                child: inputCenter(check ? white : black1f, 14,
                                    data[index]['subText'], w400),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: pSymmetric(10, 0),
                          child: input(
                              black, 28, '\$' + data[index]['price'], w700),
                        ),
                        input(grey61, 14, 'per month', w400),
                        Column(
                          crossAxisAlignment: cStart,
                          children: List.generate(
                              feature.length,
                              (indexs) => Padding(
                                    padding: pSymmetric(10, 0),
                                    child: Row(
                                      children: [
                                        index == 0
                                            ? indexs < 3
                                                ? const Icon(
                                                    Icons.check_circle,
                                                    color: Colors.greenAccent,
                                                    size: 14,
                                                  )
                                                : const Icon(
                                                    Icons.close_rounded,
                                                    color: Colors.redAccent,
                                                    size: 14,
                                                  )
                                            : index == 1
                                                ? indexs < 6
                                                    ? const Icon(
                                                        Icons.check_circle,
                                                        color:
                                                            Colors.greenAccent,
                                                        size: 14,
                                                      )
                                                    : const Icon(
                                                        Icons.close_rounded,
                                                        color: Colors.redAccent,
                                                        size: 14,
                                                      )
                                                : const Icon(
                                                    Icons.check_circle,
                                                    color: Colors.greenAccent,
                                                    size: 14,
                                                  ),
                                        wspacer(5),
                                        Flexible(
                                            child: input(grey3c, 14,
                                                feature[indexs], w400))
                                      ],
                                    ),
                                  )),
                        )
                      ],
                    ),
                  );
                }),
              )),
    ));
  }
}
