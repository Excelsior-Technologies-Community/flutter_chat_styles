import 'message_type.dart';

class ChatMessage {
  final String content;
  final bool isSender;
  final MessageType type;

  ChatMessage({
    required this.content,
    required this.isSender,
    required this.type,
  });
}
