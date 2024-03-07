import 'package:flutter/material.dart';

import '../../Widget/text_widgets.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key, this.scrollController});
  final ScrollController? scrollController;

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  int tab2 = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              List data = ['Last year', 'Today', 'Last week', 'Last Month'];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    tab2 = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tab2 != index
                          ? const Color(0xffF3F3F3)
                          : const Color(0xff1C1B1F),
                      borderRadius: BorderRadius.circular(16)),
                  child: NormalText(
                    color: tab2 == index ? Colors.white : Colors.black,
                    fontSize: 14,
                    text: data[index],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            })),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide(width: 1, color: Color(0xffD9D9D9)),
                bottom: BorderSide.none,
              )),
              child: Column(
                children: List.generate(
                    7,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: NormalText(
                            color: const Color(0xff1C1C1C),
                            fontSize: 12,
                            text: '${(index + 1) * 10000}',
                            fontWeight: FontWeight.w500,
                          ),
                        )),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset('assets/graph.png'),
          ],
        )
      ],
    );
  }
}
