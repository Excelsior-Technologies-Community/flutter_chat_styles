import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_styles/models/chat_message.dart';
import 'package:flutter_chat_styles/models/message_type.dart';
import 'package:flutter_chat_styles/widgets/chat_bubble.dart';
import 'package:flutter_chat_styles/widgets/message_input.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> messages = [];
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendText() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      messages.add(ChatMessage(
        content: controller.text,
        isSender: true,
        type: MessageType.text,
      ));
    });

    controller.clear();
    scrollToBottom();

    // Add automatic receiver reply for text
    sendReceiverReply();
  }

  Future<void> pickFromGallery() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result == null || result.files.single.path == null) return;

    setState(() {
      messages.add(ChatMessage(
        content: result.files.single.path!,
        isSender: true,
        type: MessageType.image,
      ));
    });

    scrollToBottom();

    // Add automatic receiver reply for image (only text, not image)
    sendReceiverReply();
  }

  void sendReceiverReply() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.add(ChatMessage(
          content: 'Okay 👍',
          isSender: false,
          type: MessageType.text,
        ));
      });

      scrollToBottom();
    });
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text("Chat Styles")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.only(bottom: 10),
              itemCount: messages.length,
              itemBuilder: (_, index) {
                return ChatBubble(message: messages[index]);
              },
            ),
          ),
          MessageInput(
            controller: controller,
            onSend: sendText,
            onImageSend: pickFromGallery,
          ),
        ],
      ),
    );
  }
}