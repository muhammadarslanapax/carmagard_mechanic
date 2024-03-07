import 'package:carmagard/Model/mechanic_payments.dart';
import 'package:carmagard/Provider/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';

import '../../Constant/utility_function.dart';
import '../../Widget/text_widgets.dart';

class _EarningTiles extends StatelessWidget {
  const _EarningTiles({super.key, required this.data});
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                      data: Jiffy.parse(data.timeOfTransaction ??
                              DateTime.now().toString())
                          .fromNow()),
                  NormalText(
                      color: Colors.green,
                      fontSize: 32,
                      text: "N ${data.amountSubtotal}",
                      fontWeight: FontWeight.w700)
                ],
              ),
              /*const Spacer(),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0.5, 6.5, 1.75, 5),
                decoration: BoxDecoration(
                    color: const Color(0xffE3F8EE),
                    borderRadius: BorderRadius.circular(12.5)),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/chart.svg'),
                    const NormalText(
                      color: Colors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      text: "+2.0",
                    ),
                  ],
                ),
              )*/
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class EarningView extends ConsumerWidget {
  const EarningView({super.key, this.scrollController});
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payments = ref.watch(getMechanicPaymentProvider);
/*    print(payments);

    final Data data = Data(
      amountSubtotal: 2000,
      createdAt: "2023-12-19T19:35:42.000Z",
      timeOfTransaction: "2023-12-19T19:35:42.000Z",
    );*/

    return switch (payments) {
      AsyncValue<MechanicPayments>(:final valueOrNull?) => Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(valueOrNull.data?.length ?? 0,
              (index) => _EarningTiles(data: valueOrNull.data![index])),
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
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: const Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.white, color: Colors.red),
          ),
        ),
    };
  }
}
