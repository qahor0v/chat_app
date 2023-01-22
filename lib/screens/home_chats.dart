import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/screens/chat_item.dart';
import 'package:flutter/material.dart';

class HomeChats extends StatelessWidget {
  const HomeChats({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(
                    chat: chats[index],
                  ),
                ),
              );
            },
            child: ChatItem(
              chat: chats[index],
            ),
          );
        },
        childCount: chats.length,
      ),
    );
  }
}
