import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/Shared functions.dart';

class Chat_Page extends StatefulWidget {
  const Chat_Page({super.key});

  @override
  State<Chat_Page> createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  List<Message> messages = [
    Message(
        text: "Hello it's Abdallah",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        issentbyme: true),
    Message(
        text: "Hello it's other person",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 4)),
        issentbyme: false)
  ];
  TextEditingController _messagecontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text("Messages",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
            padding: EdgeInsets.all(8),
            elements: messages,
            reverse: true,
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            floatingHeader: true,
            groupBy: (message) => DateTime(
                message.date!.year, message.date!.month, message.date!.day),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "${DateFormat.yMMMd().format(message.date!)}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Message message) => Align(
              alignment: message.issentbyme!
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("${message.text}"),
                ),
              ),
            ),
          )),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade100,
                ),
                width: 350,
                height: 50,
                child: TextField(
                  controller: _messagecontroler,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      contentPadding: EdgeInsets.all(12),
                      hintText: "Type your Message Here",
                      suffixIcon: Icon(Icons.insert_drive_file)),
                ),
              ),
              IconButton(
                  onPressed: () {
                    final message1 = Message(
                        text: _messagecontroler.text,
                        date: DateTime.now(),
                        issentbyme: true);
                    if (message1.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter a valid message")));
                    } else {
                      messages.add(message1);
                      _messagecontroler.clear();
                      setState(() {});
                    }
                  },
                  icon: Icon(
                    size: 30,
                    Icons.send_rounded,
                    color: Theme.of(context).primaryColor,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
