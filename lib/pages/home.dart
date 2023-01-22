import 'package:chat_app/screens/home_chats.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Flutter Chat"),
        actions: const [
          Icon(
            Icons.search,
          ),
          SizedBox(width: 8),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          HomeChats(),
        ],
      ),
    );
  }
}
