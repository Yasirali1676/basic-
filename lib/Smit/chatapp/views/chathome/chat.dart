import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, String>> localMessages = []; // Messages from SharedPreferences

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  // Load messages from SharedPreferences
  Future<void> _loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedMessages = prefs.getString('chat_messages');

    if (savedMessages != null) {
      setState(() {
        localMessages = List<Map<String, String>>.from(json.decode(savedMessages));
      });
    }
  }

  // Save messages to SharedPreferences
  Future<void> _saveMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('chat_messages', json.encode(localMessages));
  }

  // Send message function
  void _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    Map<String, String> newMessage = {
      "text": _controller.text,
      "sender": "self"
    };

    // Save to Firestore
    await _firestore.collection("messages").add({
      "text": _controller.text,
      "sender": "self",
      "timestamp": FieldValue.serverTimestamp(),
    });

    // Save to local storage (SharedPreferences)
    setState(() {
      localMessages.add(newMessage);
    });

    await _saveMessages();

    _controller.clear();
  }

  // Clear previous messages from SharedPreferences
  Future<void> _clearMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('chat_messages');
    setState(() {
      localMessages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Michael Johnson"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _clearMessages, // Clear chat history
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("messages").orderBy("timestamp").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                // Convert Firebase messages to List<Map<String, String>>
                List<Map<String, dynamic>> firebaseMessages = snapshot.data!.docs.map((doc) {
                  return {
                    "text": doc["text"] ?? "",
                    "sender": doc["sender"] ?? "other"
                  };
                }).toList();

                // Combine local (SharedPreferences) and Firebase messages
                List<Map<String, String>> allMessages = [...localMessages, ];

                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: allMessages.length,
                  itemBuilder: (context, index) {
                    var message = allMessages[index];
                    final isSelf = message["sender"] == "self";

                    return Align(
                      alignment: isSelf ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: isSelf ? Colors.black : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          message["text"]!,
                          style: TextStyle(
                            color: isSelf ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
