import 'package:chat_app/models/message.dart';

class Chat {
  String title;
  String image;
  String lastOnline;
  List<Message> chatMessages;

  Chat({
    required this.title,
    required this.image,
    required this.lastOnline,
    required this.chatMessages,
  });
}
