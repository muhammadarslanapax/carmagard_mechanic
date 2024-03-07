import 'package:carmagard/Model/ticket_response.dart';
import 'package:carmagard/Provider/tickets_provider.dart';
import 'package:carmagard/Widget/message_bubbles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class TicketReplies extends ConsumerStatefulWidget {
  const TicketReplies({super.key, required this.ticketTitle, required this.id});
  final String ticketTitle;
  final String id;

  @override
  ConsumerState createState() => _TicketRepliesState();
}

class _TicketRepliesState extends ConsumerState<TicketReplies> {
  TextEditingController controller = TextEditingController();
  XFile? imageFile;
  final focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(getTicketProvider(widget.id));

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.1,
        title: Text(widget.ticketTitle),
      ),
      body: Column(
        children: [
          switch (messages) {
            AsyncValue<SingleTicketResponse?>(:final valueOrNull?) => Expanded(
                flex: 100,
                child: ListView.builder(
                    //padding: EdgeInsets.only(top: 10, bottom: 10),
                    // reverse: true,
                    itemCount: valueOrNull.data?.replies?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = valueOrNull.data?.replies?.elementAt(index);
                      return MessageBubble(
                        text: data?.text ?? "Error",
                        isUser: data?.from == "mechanic",
                        attachment: data?.attachments?.isNotEmpty == true
                            ? data?.attachments?.first.url
                            : null,
                        time: data?.time ?? "",
                      );
                    }),
              ),
            AsyncValue(:final error?) => Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                      child: Text(
                          "Error: ${(error as DioException).response?.data["message"]}")),
                ),
              ),
            _ => const Expanded(
                flex: 10,
                child: Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.white, color: Colors.red),
                ),
              ),
          },
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.add_a_photo_outlined),
                onPressed: () async {
                  imageFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                },
              ),
              /* const SizedBox(
                width: 20,
              ),*/
              SizedBox(
                width: 300,
                child: TextField(
                  minLines: 1,
                  maxLines: 3,
                  focusNode: focusNode,
                  controller: controller,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 5),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 5),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    focusNode.unfocus();

                    if (controller.text.isEmpty) return;
                    await ref.read(addTicketProvider.notifier).replyTicket(
                        controller.text, widget.id,
                        attachments: imageFile);
                    imageFile = null;
                    controller.clear();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
