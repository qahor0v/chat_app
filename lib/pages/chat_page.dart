import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final Chat chat;
  const ChatPage({required this.chat, super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = <Message>[];
  final controller = TextEditingController();
  final time = DateTime.now();
  ScrollController sController = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      messages.addAll(widget.chat.chatMessages);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Chat myChat = widget.chat;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade200,
        body: Column(
          children: [
            Container(
              height: height * 0.1,
              width: double.infinity,
              color: Colors.blue,
              margin: const EdgeInsets.only(bottom: 2),
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: 8,
                right: 8,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      myChat.image,
                      width: height * 0.08,
                      height: height * 0.08,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        myChat.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Last activity: ${myChat.lastOnline}",
                        style: TextStyle(
                          color: Colors.blueGrey.shade100,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                controller: sController,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return messageWidget(messages[index]);
                      },
                      childCount: messages.length,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 50),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 4,
                left: 8,
                right: 4,
              ),
              height: height * 0.08,
              color: Colors.white,
              child: Center(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Message",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        var hour =
                            time.hour < 10 ? "0${time.hour}" : "${time.hour}";
                        var minute = time.minute < 10
                            ? "0${time.minute}"
                            : "${time.minute}";
                        setState(() {
                          messages.add(
                            Message(
                              title: controller.text.trim(),
                              time: "$hour:$minute",
                              myMessage: true,
                              readed: false,
                            ),
                          );
                          controller.clear();
                        });
                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.unfocus();
                      },
                      child: Icon(
                        Icons.send,
                        color:
                            controller.text.isEmpty ? Colors.grey : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageWidget(Message message) {
    return Container(
      margin: EdgeInsets.only(
        left: message.myMessage ? 100 : 16,
        right: message.myMessage ? 16 : 100,
        top: 16,
      ),
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 6,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: message.myMessage ? Colors.green.shade100 : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: message.myMessage
              ? const Radius.circular(20)
              : const Radius.circular(2),
          bottomRight: message.myMessage
              ? const Radius.circular(2)
              : const Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              message.myMessage
                  ? Icon(
                      message.readed ? Icons.done_all : Icons.done,
                      color: Colors.green,
                    )
                  : const SizedBox.shrink(),
              const SizedBox(width: 8),
              Text(message.time),
            ],
          )
        ],
      ),
    );
  }
}
