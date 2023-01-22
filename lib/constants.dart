import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/message.dart';

final List<Chat> chats = <Chat>[
  Chat(
    title: "Shuhrat 2005",
    image: "assets/person1.jpg",
    lastOnline: "01:02",
    chatMessages: [
      Message(
        myMessage: true,
        title: "Assalomu Alaykum. Yaxshimisan?",
        time: "00:09",
        readed: false,
      ),
    ],
  ),
  Chat(
    title: "Azizbek Murotov",
    image: "assets/person5.jpg",
    lastOnline: "11:02",
    chatMessages: [
      Message(
        myMessage: false,
        title: "Haa, to'g'ri lekin. Bir urinib ko'rish kerak.",
        time: "10:09",
        readed: true,
      ),
    ],
  ),
  Chat(
    title: "Diyor",
    image: "assets/person3.jpg",
    lastOnline: "22:02",
    chatMessages: [
      Message(
        myMessage: true,
        title: "Mana shunday bo'ladi.",
        time: "21:09",
        readed: true,
      ),
    ],
  ),
  Chat(
    title: "Karimjon",
    image: "assets/person4.jpg",
    lastOnline: "01:20",
    chatMessages: [
      Message(
        myMessage: false,
        title: "Oshga boramizmi?",
        time: "01:09",
        readed: false,
      ),
    ],
  ),
  Chat(
    title: "Muhriddin",
    image: "assets/person5.jpg",
    lastOnline: "04:02",
    chatMessages: [
      Message(
        myMessage: true,
        title: "Xay mayli, sog' bo'ling",
        time: "03:09",
        readed: false,
      ),
    ],
  ),
  Chat(
    title: "Ustoz Shifu",
    image: "assets/person1.jpg",
    lastOnline: "23:02",
    chatMessages: [
      Message(
        myMessage: true,
        title: "Qayerdasan?",
        time: "22:22",
        readed: false,
      ),
    ],
  ),
];
