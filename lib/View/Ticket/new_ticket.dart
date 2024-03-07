import 'package:carmagard/Constant/types.dart';
import 'package:carmagard/Provider/tickets_provider.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../Widget/adaptive_button.dart';
import '../../Widget/custom_dropdown.dart';
import '../../Widget/custom_snackbar.dart';

class NewTickets extends ConsumerStatefulWidget {
  const NewTickets({super.key});

  @override
  ConsumerState<NewTickets> createState() => _NewTicketsState();
}

class _NewTicketsState extends ConsumerState<NewTickets> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  TicketTypes selectedCategory = TicketTypes.generalQuestion;
  Priority selectedPriority = Priority.medium;
  Map<String, dynamic>? error;
  // final TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(addTicketProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        error = (next.error as DioException).response?.data
            as Map<String, dynamic>?;
        var snackBar = customSnackBar(error?["message"] ?? "");
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      if (next.value?.status == "success" && !next.isLoading) {
        Navigator.pop(context);
      }
    });
    // print(MediaQuery.viewInsetsOf(context).bottom);
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*  Visibility(
                child: Text(
              error?["message"] ?? "",
              style: TextStyle(color: Colors.black),
            )),*/
            Align(
              alignment: Alignment.topRight,
              child: adaptiveAction(
                context: context,
                onPressed: () async {
                  /* print(selectedCategory.toOriginal());
                  print(selectedPriority.name);*/
                  FocusManager.instance.primaryFocus?.unfocus();
                  await ref.read(addTicketProvider.notifier).addTicket(
                      subjectController.text.trim(),
                      selectedCategory.toOriginal(),
                      selectedPriority.name,
                      descriptionController.text.trim());
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            TextFieldWithColumn(
              controller: subjectController,
              hint: "Subject",
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomDropDown<TicketTypes>(
                hint: "Category",
                items: TicketTypes.values,
                onChanged: (value) {
                  setState(() => selectedCategory = value!);
                },
                selectedValue: selectedCategory,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomDropDown<Priority>(
                hint: "Priority",
                items: Priority.values,
                onChanged: (value) {
                  setState(() => selectedPriority = value!);
                },
                selectedValue: selectedPriority,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: LargeTextField(
                controller: descriptionController,
                hint: "Description",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [Text("Attachment: ")],
            )
          ],
        ),
      ),
    );
  }
}
