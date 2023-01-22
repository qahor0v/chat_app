import 'package:chat_app/models/chat.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final Chat chat;
  const ChatItem({required this.chat, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.11,
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        bottom: 4,
        top: 4,
      ),
      margin: const EdgeInsets.only(
        top: 1,
        left: 4,
        right: 4,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              chat.image,
              width: height * 0.1,
              height: height * 0.1,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      chat.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        chat.chatMessages.last.title,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Column(
              children: [
                Text(
                  chat.chatMessages.last.time,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Icon(
                  chat.chatMessages.last.readed ? Icons.done_all : Icons.done,
                  color: Colors.green,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
