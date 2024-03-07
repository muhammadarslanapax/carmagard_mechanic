import 'package:carmagard/Provider/service_request_provider.dart';
import 'package:carmagard/View/Handymen/commonwidget.dart';
import 'package:carmagard/View/Handymen/userdrawer.dart';
import 'package:carmagard/View/google_map/maps_screen.dart';
import 'package:flutter/material.dart';
import 'package:carmagard/View/style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import '../View/draggable_views/bookings_view.dart';
import '../View/draggable_views/earning_view.dart';
import '../View/draggable_views/rating_view.dart';
import '../View/draggable_views/statistics_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Ui {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: UserDrawerView(),
      body: Stack(
        children: [
          MapScreen(),
          Align(alignment: Alignment.bottomCenter, child: BottomMechanic()),
        ],
      ),
    );
  }
}

class BottomMechanic extends ConsumerStatefulWidget {
  const BottomMechanic({super.key});

  @override
  ConsumerState<BottomMechanic> createState() => _BottomMechanicState();
}

class _BottomMechanicState extends ConsumerState<BottomMechanic>
    with Ui, CommonWidget {
  final DraggableScrollableController dragController =
      DraggableScrollableController();
  int tab = 0;
  int tab2 = 0;
  final data = ['Earnings', 'Rating', 'Bookings']; //, 'Statistics'];
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.1,
      maxChildSize: 0.8,
      initialChildSize: 0.1,
      controller: dragController,
      snap: true,
      builder: (context, scrollController) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 85,
                  maxHeight: 85,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          const Center(
                            child: SizedBox(
                              width: 50,
                              child: Divider(
                                thickness: 4,
                              ),
                            ),
                          ),
                          Container(
                            width: width(context),
                            padding: pSymmetric(12, 12),
                            decoration: BoxDecoration(
                                borderRadius: borderR(20),
                                color: const Color(0xffF3F3F3)),
                            child: Row(
                              mainAxisAlignment: mBtw,
                              children: List.generate(3, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() => tab = index);

                                    if (dragController.size < 0.3) {
                                      dragController.animateTo(0.3,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                    }
                                  },
                                  child: Container(
                                    alignment: center,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: tab != index
                                            ? const Color(0xffF3F3F3)
                                            : white,
                                        borderRadius: borderR(16)),
                                    child: input(black, 12, data[index], w500),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  switch (tab) {
                    0 => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: EarningView(),
                      ),
                    1 => const RatingView(),
                    _ => const BookingView(),
                  },
                ]),
              )
            ],
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => minHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
