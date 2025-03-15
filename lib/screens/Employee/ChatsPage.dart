import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example chat data with companies
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Tech Innovators',
        'logo': 'assets/tech_innovators.jpg',
        'industry': 'Technology',
        'lastMessage': 'We reviewed your application!',
        'time': '10:30 AM',
        'unread': true,
      },
      {
        'name': 'HealthCare Solutions',
        'logo': 'assets/healthcare_solutions.jpg',
        'industry': 'Healthcare',
        'lastMessage': 'Can you share your CV?',
        'time': 'Yesterday',
        'unread': false,
      },
      {
        'name': 'EduCare Academy',
        'logo': 'assets/educare_academy.jpg',
        'industry': 'Education',
        'lastMessage': 'We have a new opportunity for you!',
        'time': '2 days ago',
        'unread': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Chats', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[100], // Light background for the chat list
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(chat['logo']),
                ),
                title: Text(
                  chat['name'],
                  style: TextStyle(
                    fontWeight: chat['unread'] ? FontWeight.bold : FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat['lastMessage'],
                      style: TextStyle(
                        color: chat['unread'] ? Colors.blue[800] : Colors.grey[700],
                      ),
                    ),
                    Text(
                      chat['industry'],
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      chat['time'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    if (chat['unread'])
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.all(4),
                        decoration:  BoxDecoration(
                          color: Colors.red[500],
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailPage(
                        companyName: chat['name'],
                        companyLogo: chat['logo'],
                        industry: chat['industry'],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new chat functionality
        },
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}

class ChatDetailPage extends StatefulWidget {
  final String companyName;
  final String companyLogo;
  final String industry;
  const ChatDetailPage({
    super.key,
    required this.companyName,
    required this.companyLogo,
    required this.industry,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text.trim(),
          'time': DateTime.now(),
          'isMe': true,
        });
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.companyLogo),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.companyName, style: TextStyle(color: Colors.white)),
                Text(
                  widget.industry,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              // Show company details
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(widget.companyName),
                    content: Text('Industry: ${widget.industry}\n\nVisit our website: www.example.com'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[100], // Light background for the chat area
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message['isMe'] ? Colors.blue[800] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            message['text'],
                            style: TextStyle(
                              color: message['isMe'] ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${message['time'].hour}:${message['time'].minute}',
                            style: TextStyle(
                              color: message['isMe'] ? Colors.white70 : Colors.grey[600],
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon:  Icon(Icons.send, color: Colors.blue[800]),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}