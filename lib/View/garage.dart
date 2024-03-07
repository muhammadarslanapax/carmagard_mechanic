import 'package:flutter/material.dart';
import 'package:carmagard/View/style.dart';

class GargageScreen extends StatefulWidget {
  const GargageScreen({super.key});

  @override
  State<GargageScreen> createState() => _GargageScreenState();
}

List<Map<String, dynamic>> cars = [
  {
    'name': 'Toyota Camry',
    'image': 'toyota_camry.jpg',
    'model': 2023,
  },
  {
    'name': 'Honda Civic',
    'image': 'honda_civic.jpg',
    'model': 2023,
  },
  {
    'name': 'Ford Mustang',
    'image': 'ford_mustang.jpg',
    'model': 2023,
  },
  {
    'name': 'Tesla Model S',
    'image': 'tesla_model_s.jpg',
    'model': 2023,
  },
  // Add more cars here as needed
];

class _GargageScreenState extends State<GargageScreen> with Ui {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: cStart,
            children: [
              backNav(context),
              Padding(
                padding: pSymmetric(15, 0),
                child: input(black, 26, 'My Garage ', w500),
              ),
              Column(
                crossAxisAlignment: cStart,
                children: List.generate(
                    cars.length,
                    (index) => Padding(
                          padding: pSymmetric(4, 0),
                          child: Material(
                            elevation: 1,
                            borderRadius: borderR(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(

                                      // color: green,
                                      borderRadius: borderR(16)),
                                  child: ClipRRect(
                                    borderRadius: borderR(16),
                                    child: Image.asset('assets/car.jpeg'),
                                  ),
                                ),
                                wspacer(15),
                                Column(
                                  crossAxisAlignment: cStart,
                                  children: [
                                    input(black, 16, cars[index]['name'], w500),
                                    input(black, 13,
                                        cars[index]['model'].toString(), w500)
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
