import 'dart:developer';

import 'package:carmagard/Model/service_response.dart';
import 'package:carmagard/Provider/service_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Widget/adaptive_button.dart';
import '../../Widget/custom_snackbar.dart';

class MechanicService extends ConsumerStatefulWidget {
  const MechanicService({super.key});

  @override
  ConsumerState<MechanicService> createState() => _MechanicServiceState();
}

class _MechanicServiceState extends ConsumerState<MechanicService> {
  @override
  Widget build(BuildContext context) {
    final tickets = ref.watch(allServicesProvider);
    ref.listen(allServicesProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        final error = (next.error as DioException).response?.data
            as Map<String, dynamic>?;
        log("Error in Service: ${error?["message"]}");
        var snackBar = customSnackBar(error?["message"] ?? "");
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Services",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: const Color(0xffF5F5F5),
                  // isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => const AddService(),
                );
              },
              icon: const Icon(Icons.add_circle_outline_rounded))
        ],
      ),
      body: RefreshIndicator.adaptive(
          child: switch (tickets) {
            AsyncValue<ServiceResponse>(:final valueOrNull?) =>
              ListView.separated(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10), //const EdgeInsets.only(top: 10, bottom: 20),
                itemCount: valueOrNull.services?.length ?? 0,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) {
                  return _TicketTab(
                    index: index,
                    data: valueOrNull.services?.elementAt(index),
                  );
                },
              ),
            AsyncValue(:final error?) => Center(
                child:
                    Text("Error: ${(error as DioException).response?.data}")),
            _ => SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.white, color: Colors.red),
                ),
              ),
          },
          onRefresh: () => ref.refresh(allServicesProvider.future)),
    );
  }
}

class AddService extends ConsumerStatefulWidget {
  const AddService({super.key});

  @override
  ConsumerState<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends ConsumerState<AddService> {
  @override
  Widget build(BuildContext context) {
    final systemService = ref.watch(systemServicesProvider);

    final checkBoxValues =
        List.generate(systemService.value?.services?.length ?? 0, (_) => false);
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: adaptiveAction(
                context: context,
                onPressed: () async {
                  final selected = [];
                  final serviceLength =
                      systemService.value?.services?.length ?? 0;
                  for (int i = 0; i < serviceLength; i++) {
                    if (checkBoxValues[i]) {
                      selected
                          .add(systemService.value?.services?[i].addToJson());
                    }
                  }
                  if (selected.isNotEmpty) {
                    await ref
                        .read(allServicesProvider.notifier)
                        .addService(selected);
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: systemService.value?.services?.length ?? 0,
                itemBuilder: (context, index) {
                  final service =
                      systemService.value?.services?.elementAt(index);
                  return CheckboxListTile(
                      value: checkBoxValues[index],
                      title: Text(service?.name ?? "None"),
                      onChanged: (onChanged) {
                        print("Na service oo: ${service?.toJson()}");
                        print(onChanged);
                        setState(() {
                          print("Ran ${checkBoxValues[index]}");
                          checkBoxValues[index] = (onChanged!);

                          print("After ${checkBoxValues[index]}");
                        });
                      });
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _TicketTab extends ConsumerWidget {
  const _TicketTab({super.key, required this.index, required this.data});
  final int index;
  final Services? data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// TODO: Redesign profile and drawer page according to bolt design
    /// Add chat stuffs
    return ListTile(
      onTap: null,
      title: Text(
        data?.name ?? "",
        maxLines: 1,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
