import 'package:bullet24/Services/FireAuth%20Service/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final _user = types.User(
    id: Authenticate.getUserUid(), // Replace with your user ID
  );
  final _admin = const types.User(
    id: 'admin', // Replace with your user ID
  );

  @override
  void initState() {
    super.initState();
    // Load your initial messages or leave it empty for a new chat.
    // _loadMessages();
  }

  // Add messages loading logic if needed
  // void _loadMessages() {
  //   // Load messages from a data source
  // }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void addAdminMessage(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _admin,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with us'),
        centerTitle: true,
        foregroundColor: Colors.white,
        // Customize the AppBar color
        backgroundColor: const Color(0xFF121212),
      ),
      // Set the background color of the entire chat page
      backgroundColor: Colors.black,
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        // Customize the Chat widget's theme
        theme: const DefaultChatTheme(
          backgroundColor: Color(0xFF121212),
          inputBackgroundColor: Color.fromARGB(96, 124, 124, 124),
          inputTextColor: Colors.white,
          primaryColor: Color.fromARGB(255, 20, 126, 213),
          secondaryColor: Color.fromARGB(
              95, 139, 139, 139), // background of chat bubble admin
          receivedMessageBodyTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          inputMargin: EdgeInsets.all(20),
          inputBorderRadius: BorderRadius.all(Radius.circular(20)),
          inputPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
