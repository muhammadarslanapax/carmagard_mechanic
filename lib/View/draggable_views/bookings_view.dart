import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Constant/dio_int.dart';
import '../../Constant/utility_function.dart';
import '../../Model/service_request_response.dart';
import '../../Provider/service_request_provider.dart';
import '../../Widget/booking_tile.dart';
import '../../Widget/custom_snackbar.dart';

List _approvedBooking(List? requests) {
  return requests
          ?.where((element) =>
              element.isApproved != null && element.isApproved == true)
          .toList() ??
      [];
}

class BookingView extends ConsumerWidget {
  const BookingView({super.key, this.scrollController});
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requests = ref.watch(myServiceRequestProvider);
    final pendingBookings = requests.value?.serviceRequests
        ?.where((element) =>
            element.isApproved != null && element.isApproved == false)
        .toList();
    final bookings = requests.value?.serviceRequests
        ?.where((element) =>
            element.isApproved != null && element.isApproved == true)
        .toList();

    // print("OmO: requests oo ${requests.error}");
    return switch (requests) {
      AsyncValue<ServiceRequestResponse?>(:final valueOrNull?) =>
        Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 10,
          ),
          Visibility(
              visible: pendingBookings?.isNotEmpty ?? false,
              child: ListTile(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return _PendingBookings(request: pendingBookings);
                })),
                title: const Text("You have pending booking"),
              )),
          ...List.generate(_approvedBooking(valueOrNull.serviceRequests).length,
              (index) => BookingTile(service: bookings![index])),
          const SizedBox(
            height: 10,
          )
        ]),
      AsyncValue(:final error?) => SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text("Error: ${errorBuilder(error)}"),
            ),
          )),
      _ => SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: const Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.white, color: Colors.red),
          ),
        ),
    };
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Visibility(
          visible: pendingBookings?.isNotEmpty ?? false,
          child: ListTile(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return _PendingBookings(request: pendingBookings);
            })),
            title: const Text("You have pending booking"),
          )),
      ...List.generate(bookings?.length ?? 0,
          (index) => BookingTile(service: bookings![index])),
      const SizedBox(
        height: 10,
      )
    ]);
  }
}

class _PendingBookings extends ConsumerStatefulWidget {
  const _PendingBookings({super.key, required this.request});
  final List<ServiceRequests>? request;

  @override
  ConsumerState<_PendingBookings> createState() => _PendingBookingsState();
}

class _PendingBookingsState extends ConsumerState<_PendingBookings> {
  @override
  Widget build(BuildContext context) {
    ref.listen(acceptBookingProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        var snackBar = customSnackBar(errorBuilder(next.error));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      if (next.value?.success == true && !next.isLoading) {
        print("Remove oo");
        setState(() {
          widget.request
              ?.removeWhere((element) => element.id == next.value?.status);
        });
      }
    });
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar.medium(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          // elevation: 0,
          // forceElevated: true,
          // forceMaterialTransparency: true,
          title: Text(
            "Pending booking",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => BookingTile(
              service: widget.request![index],
              pendingBooking: true,
            ),
            childCount: widget.request?.length ?? 0,
          ),
        )
      ]),
    );
  }
}
