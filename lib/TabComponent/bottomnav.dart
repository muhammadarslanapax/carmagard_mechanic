// // ignore_for_file: deprecated_member_use
 
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:carmagard/View/style.dart';

// import '../Provider/bottomnavprovider.dart';

 

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> with Ui {
//   List bottomComp = [
//     {'name': 'Home', 'nav':  SizedBox(), 'icon': 'home'},
//     {'name': 'Savings', 'nav': SizedBox(), 'icon': 'save'},
//     {'name': 'Shop', 'nav': SizedBox(), 'icon': 'shop'},
//     {
//       'name': 'Purchases',
//       'nav': SizedBox(),
//       'icon': 'transactions'
//     },
//     {'name': 'Account', 'nav': SizedBox(), 'icon': 'profile'},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (_, ref, __) {
//       var props = ref.watch(bottomNavRepo);
//       return Scaffold(
//         backgroundColor: const Color(0xffFBF9FB),
//         body: IndexedStack(
//           index: props.tabIndex,
//           children: List.generate(
//               bottomComp.length, (index) => bottomComp[index]['nav']),
//         ),
//         bottomNavigationBar: BottomAppBar(
//           elevation: 2,
//           color: white,
//           child: SizedBox(
//               height: 70,
//               child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: List.generate(
//                     bottomComp.length,
//                     (index) => Column(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             // print(ref.watch(authToken));
//                             setState(() {
//                               props.updateIndex(index);
//                             });

//                             navW(context, const BottomNav());
//                           },
//                           icon: SvgPicture.asset(
//                               'assets/${bottomComp[index]['icon']}.svg',
//                               width: 25,
//                               height: 25,
//                               color: props.tabIndex == index ? blue : grey85),
//                         ),
//                         Text(bottomComp[index]['name'],
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 12,
//                                 color:
//                                     (props.tabIndex == index) ? blue : grey85)),
//                       ],
//                     ),
//                   ))),
//         ),
//       );
//     });
//   }
// }
