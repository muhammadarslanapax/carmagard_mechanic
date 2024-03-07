import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final String? attachment;
  final String time;
  const MessageBubble(
      {super.key,
      required this.text,
      required this.isUser,
      this.attachment,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: //EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          EdgeInsets.fromLTRB(
        isUser ? 90 : 16.0,
        8,
        isUser ? 16.0 : 90.0, //16.0 : 84
        8,
      ),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isUser ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              attachment != null
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: Image.network(
                        attachment!,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5), //12
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: isUser ? Colors.white : Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(time),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
