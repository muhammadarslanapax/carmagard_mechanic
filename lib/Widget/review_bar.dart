import 'package:carmagard/Provider/rating_provider.dart';
import 'package:carmagard/Widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingBars extends ConsumerWidget {
  const RatingBars({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bar = ref.watch(mechanicRatingProvider);
    final ratings = bar.value?.data?.ratingDistribution;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.zero,
              child:
                  _CustomBars(value: (ratings?.one ?? 0) / 100, numbers: "1 ")),
          _CustomBars(value: (ratings?.two ?? 0) / 100, numbers: "2"),
          _CustomBars(value: (ratings?.three ?? 0) / 100, numbers: "3"),
          _CustomBars(value: (ratings?.four ?? 0) / 100, numbers: "4"),
          _CustomBars(value: (ratings?.five ?? 0) / 100, numbers: "5"),
        ].reversed.toList(),
      ),
    );
  }
}

class _CustomBars extends StatelessWidget {
  const _CustomBars({
    super.key,
    required this.value,
    required this.numbers,
  });
  final double value;
  final String numbers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NormalText(
            color: const Color(0xff787878),
            fontSize: 12,
            text: numbers,
            fontWeight: FontWeight.w400),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 8,
          width: ((MediaQuery.sizeOf(context).width - 32) / 2),
          child: LinearProgressIndicator(
            value: value,
            borderRadius: BorderRadius.circular(4),
            backgroundColor: const Color(0xfffafafa),
            valueColor: const AlwaysStoppedAnimation(Color(0xffFFCC00)),
          ),
        ),
      ],
    );
  }
}
