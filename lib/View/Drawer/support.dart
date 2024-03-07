import 'dart:developer';

import 'package:carmagard/Constant/utility_function.dart';
import 'package:carmagard/Model/ticket_response.dart';
import 'package:carmagard/Model/tickets_response.dart';
import 'package:carmagard/Provider/tickets_provider.dart';
import 'package:carmagard/View/Ticket/message_room.dart';
import 'package:carmagard/View/Ticket/new_ticket.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Widget/adaptive_button.dart';
import '../../Widget/custom_snackbar.dart';

class SupportTab extends ConsumerStatefulWidget {
  const SupportTab({super.key});

  @override
  ConsumerState<SupportTab> createState() => _SupportTabState();
}

class _SupportTabState extends ConsumerState<SupportTab> {
  @override
  Widget build(BuildContext context) {
    final tickets = ref.watch(allTicketsProvider);
    ref.listen(allTicketsProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        var snackBar = customSnackBar(errorBuilder(next.error));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tickets"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: const Color(0xffF5F5F5),
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => const NewTickets(),
                );
              },
              icon: const Icon(Icons.add_circle_outline_rounded))
        ],
      ),
      body: RefreshIndicator.adaptive(
          child: switch (tickets) {
            AsyncValue<TicketsResponse>(:final valueOrNull?) => SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: valueOrNull.data?.length ?? 0,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemBuilder: (context, index) {
                    return _TicketTab(
                      index: index,
                      data: valueOrNull.data?.elementAt(index),
                    );
                  },
                ),
              ),
            AsyncValue(:final error?) => SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text("Error: ${errorBuilder(error)}"),
                  ),
                )),
            _ => SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.white, color: Colors.red),
                ),
              ),
          },
          onRefresh: () => ref.refresh(allTicketsProvider.future)),
    );
  }
}

class _TicketTab extends ConsumerWidget {
  const _TicketTab({super.key, required this.index, required this.data});
  final int index;
  final Data? data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketStatus = switch (data?.status) {
      "Open" => true,
      _ => false,
    };
    return GestureDetector(
      onTap: () async {
        if (context.mounted) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TicketReplies(
                ticketTitle: data?.subject ?? "", id: data?.id ?? "");
          }));
        }
      },
      child: Container(
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF5F5F5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(height: 10),
                  Text(
                    data?.subject ?? "",
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    data?.description ?? "",
                    softWrap: true,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 15, overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    data?.createdAt ?? "",
                    style: const TextStyle(
                        fontSize: 13, overflow: TextOverflow.fade),
                  ),
                ],
              ),
            ),
            /*  const SizedBox(
              height: 10,
            ),*/
            const Spacer(),
            Container(
              alignment: Alignment.center,
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ticketStatus ? Colors.green : Colors.red,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Text(
                data?.status ?? "",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
