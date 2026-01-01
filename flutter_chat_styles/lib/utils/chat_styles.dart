import 'package:flutter/material.dart';

class ChatStyles {
  static const senderColor = Color(0xffDCF8C6);
  static const receiverColor = Colors.white;

  static BorderRadius senderRadius = const BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
    bottomLeft: Radius.circular(16),
  );

  static BorderRadius receiverRadius = const BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
    bottomRight: Radius.circular(16),
  );
}
