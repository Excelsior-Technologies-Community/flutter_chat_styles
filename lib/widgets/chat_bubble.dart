import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_chat_styles/models/chat_message.dart';
import 'package:flutter_chat_styles/models/message_type.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSender = message.isSender;

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: message.type == MessageType.image
            ? _imageBubble(isSender)
            : _textBubble(isSender),
      ),
    );
  }

  Widget _imageBubble(bool isSender) {
    final bool isNetworkImage = message.content.startsWith('http');

    return Container(
      width: 230,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSender ? Colors.blue : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: isNetworkImage
                ? Image.network(
                    message.content,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(message.content),
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 4),
          Text(
            "10:32 AM",
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  /// 💬 TEXT BUBBLE
  Widget _textBubble(bool isSender) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isSender ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        message.content,
        style: TextStyle(
          color: isSender ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
