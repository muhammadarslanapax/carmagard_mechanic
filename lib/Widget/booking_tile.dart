import 'package:carmagard/Provider/service_request_provider.dart';
import 'package:carmagard/Widget/adaptive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';

import '../Model/service_request_response.dart';

class BookingTile extends ConsumerWidget {
  const BookingTile(
      {super.key, required this.service, this.pendingBooking = false});
  final ServiceRequests service;
  final bool pendingBooking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10), //pSymmetric(10, 0),
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        elevation: 1,
        // borderRadius: borderR(8),
        color: Colors.white, //t ? const Color(0xfff6f6f6) : white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.request ?? "...",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 15,
                        ),
                        Flexible(
                          child: Text(
                            service.address ?? "...",
                            style: const TextStyle(fontSize: 14),
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        Jiffy.parse(service.date ?? DateTime.now().toString())
                            .format(pattern: "MMMM d, yyyy"),
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
            switch (pendingBooking) {
              true => adaptiveAction(
                  context: context,
                  onPressed: () {
                    ref
                        .read(acceptBookingProvider.notifier)
                        .acceptBooking(service.id ?? "");
                  },
                  child: const Text("Accept")),
              false => const SizedBox(),
            },
          ],
        ),
      ),
    );
  }
}
