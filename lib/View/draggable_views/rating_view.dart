import 'package:carmagard/Provider/rating_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widget/rating_tile.dart';
import '../../Widget/review_bar.dart';
import '../../Widget/text_widgets.dart';

class RatingView extends ConsumerStatefulWidget {
  const RatingView({super.key, this.scrollController});
  final ScrollController? scrollController;

  @override
  ConsumerState<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends ConsumerState<RatingView> {
  @override
  Widget build(BuildContext context) {
    final ratings = ref.watch(mechanicRatingProvider);
    // ref.invalidate(mechanicRatingProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          const NormalText(
            text: "Review summary",
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    text:
                        ratings.value?.data?.overallRating.toString() ?? "0.0",
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.black,
                  ),
                  const _RatingStars(),
                  NormalText(
                    text:
                        " ${ratings.value?.data?.totalRatings.toString() ?? 0} reviews",
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const Spacer(),
              const RatingBars(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const RatingTab(),
        ],
      ),
    );
  }
}

class _RatingStars extends ConsumerWidget {
  const _RatingStars({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stars = ref.watch(mechanicRatingProvider);
    return RatingBarIndicator(
      rating: stars.value?.data?.overallRating ?? 0.0,
      itemBuilder: (BuildContext context, int index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemSize: 15,
    );
  }
}
