import 'package:dashboard/Smit/chatapp/views/chathome/chat.dart';
import 'package:flutter/material.dart';

class PersonList extends StatelessWidget {
  const PersonList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatListScreen(),
    );
  }
}

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  TextEditingController _searchController = TextEditingController();

List<Map<String, String>> chats = [
  {"name": "Michael Johnson", "message": "This is chat App is Amiazing ", "date": "2 Jan", "image": "asset/image/ali1.jpeg"},
  {"name": "Sarah Williams", "message": "Can you send me more details?", "date": "4 Jan", "image": "asset/image/ali4.jpeg"},
  {"name": "David Smith", "message": "Let me know when you're free to talk.", "date": "3 Jan", "image": "asset/image/ali5.jpeg"},
  {"name": "Emily Brown", "message": "I’d like to place an order. What’s the process?", "date": "7 Jan", "image": "asset/image/ali6.jpeg"},
  {"name": "James Anderson", "message": "Thanks for the update! I'll check it out.", "date": "1 Jan", "image": "asset/image/ali7.jpeg"},
  {"name": "Olivia Martinez", "message": "Is there any discount available?", "date": "2 Jan", "image": "asset/image/ali8.jpeg"},
  {"name": "Daniel Thompson", "message": "Can you confirm the shipping date?", "date": "2 Jan", "image": "asset/image/ali1.jpeg"},
  {"name": "William Carter", "message": "I received the package, but there’s an issue.", "date": "2 Jan", "image": "asset/image/ali1.jpeg"},
  {"name": "Sophia Davis", "message": "Hey! It was great doing business with you.", "date": "4 Jan", "image": "asset/image/ali4.jpeg"},
  {"name": "Benjamin Wilson", "message": "I’ll get back to you later today.", "date": "3 Jan", "image": "asset/image/ali5.jpeg"},
  {"name": "Ava Harris", "message": "Could you share the tracking number?", "date": "7 Jan", "image": "asset/image/ali6.jpeg"},
  {"name": "Ethan Clark", "message": "Can we schedule a call to discuss?", "date": "1 Jan", "image": "asset/image/ali7.jpeg"},
  {"name": "Madison White", "message": "I’m really happy with the purchase!", "date": "2 Jan", "image": "asset/image/ali8.jpeg"},
  {"name": "Logan Hall", "message": "Let’s finalize the deal today.", "date": "2 Jan", "image": "asset/image/ali1.jpeg"},
];



  List<Map<String, String>> filteredChats = [];

  @override
   void initState() {
    super.initState();
    filteredChats = chats;
  }

  void _filterChats(String query) {
    setState(() {
      filteredChats = chats
          .where((chat) => chat["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 45,
              child: TextField(
                controller: _searchController,
                onChanged: _filterChats,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(chat["image"]!),
                    onBackgroundImageError: (_, __) => const AssetImage("asset/image/ali1.jpeg"), // Placeholder if image fails
                  ),
                  title: Text(chat["name"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(chat["message"]!),
                  trailing: Text(chat["date"]!),
                  onTap: () {
                   Navigator.push(
                                 context,
                                     MaterialPageRoute(builder: (context) => ChatScreen(),));
                
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
