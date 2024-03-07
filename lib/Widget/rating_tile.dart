import 'package:carmagard/Constant/utility_function.dart';
import 'package:carmagard/Model/review_response.dart';
import 'package:carmagard/Provider/review_provider.dart';
import 'package:carmagard/Widget/text_widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../generated/assets.dart';

class RatingTab extends ConsumerWidget {
  const RatingTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(mechanicReviewsProvider);
    // ref.invalidate(mechanicReviewsProvider);
    // return _RTabs(review: ReviewData());
    return switch (reviews) {
      AsyncValue<ReviewResponse>(:final valueOrNull?) => SizedBox(
          height: 150,
          child: ListView.separated(
              itemBuilder: (context, index) {
                final review = valueOrNull.data?[index];
                return _RTabs(review: review);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: valueOrNull.data?.length ?? 0),
        ),
      AsyncValue(:final error?) => SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text("Error: ${errorBuilder(error)}"),
            ),
          )),
      _ => SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: const Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.white, color: Colors.red),
          ),
        ),
    };
  }
}

class _RTabs extends StatelessWidget {
  const _RTabs({super.key, required this.review});
  final ReviewData? review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Material(
        elevation: 1,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Image.asset('assets/review.png'),
                  review?.user?.avatar?.url != null
                      ? Image.network((review?.user?.avatar!.url)!)
                      : SvgPicture.asset(
                          Assets.assetsUser1,
                          height: 28,
                        ),
                  const SizedBox(width: 10),
                  NormalText(
                    color: Colors.black,
                    fontSize: 16,
                    text: review?.user?.name ?? "",
                    fontWeight: FontWeight.w400,
                  ),
                  const Spacer(),

                  RatingBarIndicator(
                    rating: (review?.rating ?? 0.0) *
                        1.0, //.value?.data?.overallRating ?? 0.0,
                    itemBuilder: (BuildContext context, int index) =>
                        const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemSize: 15,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: NormalText(
                  color: Colors.black,
                  fontSize: 12,
                  text: review?.service?.name ?? "",
                  // fontWeight: FontWeight.w700,
                ),
              ),
              /*   const NormalText(
                color: Colors.black,
                fontSize: 16,
                text: 'He arrived on time',
                fontWeight: FontWeight.w700,
              ),*/
              Text(
                review?.review ?? "",
                maxLines: 3,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff3C3C3C),
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
