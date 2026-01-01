# ChatStyles

A lightweight **Flutter chat UI library** for building chat apps quickly.  
Includes **chat bubbles, message input, image picker button, and customizable styles**.  

---
## ✨ Features
- Fully functional **chat screen**
- **Message bubbles** for sent and received messages
- **Message input widget** with send button
- **Image picker button** for picking images from gallery or camera
- Customizable **colors, text styles, and bubble styles**
- Easy to integrate into any Flutter project
- Fully testable with **widget tests**

---

## ✨ Preview
![screen-20260101-1755072](https://github.com/user-attachments/assets/0fa38adb-c9cc-4e53-b549-937352a82102)

---
## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_chat_styles:
    path: ../flutter_chat_styles  # For local development
```
from git:
```
dependencies:
  flutter_chat_styles:
    git:
      url: https://github.com/yourusername/flutter_chat_styles.git  # Your github path
``` 
Then run:
```
flutter pub get
```
---

## 📁Project Structure
```
flutter_chat_styles/
│
├─ lib/
│  ├─ models/
│  │  ├─ chat_message.dart
│  │  └─ message_type.dart
│  ├─ screens/
│  │  └─ chat_screen.dart
│  ├─ widgets/
│  │  ├─ chat_bubble.dart
│  │  ├─ image_picker_button.dart
│  │  └─ message_input.dart
│  └─ utils/
│     └─ chat_styles.dart
├─ test/
│  └─ chat_widgets_test.dart
└─ pubspec.yaml
```
---
## 🛠 Dependencies
```
dependencies:
  flutter:
    sdk: flutter
  file_picker: ^6.0.0  # For picking images from gallery
```
---
## 📄 Code Overview
### 1️⃣ ChatMessage Model
###### Defines a message with:
* content: text or image path
* isSender: true if the message is sent by the user
* type: MessageType.text or MessageType.image
```
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

enum MessageType { text, image }
```
### 2️⃣ ChatBubble Widget
###### Custom UI for displaying messages:
* Text messages: colored bubble
* Image messages: network/local image support
```
ChatBubble(message: ChatMessage(...));
```
### 3️⃣ MessageInput Widget
###### Text input with:
* Send button for text
* Image button to pick image from gallery
* Multi-line support
```
MessageInput(
  controller: controller,
  onSend: sendText,
  onImageSend: pickFromGallery,
);
```
## 4️⃣ ChatScreen
###### Main screen that manages:
* Message list
* Sending messages
* Picking images
* Automatic receiver reply
* Scrolling to bottom

---
## 🎨 Chat Styles
```
class ChatStyles {
  static const senderColor = Color(0xffDCF8C6);
  static const receiverColor = Colors.white;

  static BorderRadius senderRadius = BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
    bottomLeft: Radius.circular(16),
  );

  static BorderRadius receiverRadius = BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
    bottomRight: Radius.circular(16),
  );
}
```
---
## 📸 Sending Images
```
Future<void> pickFromGallery() async {
  final result = await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null && result.files.single.path != null) {
    setState(() {
      messages.add(ChatMessage(
        content: result.files.single.path!,
        isSender: true,
        type: MessageType.image,
      ));
    });
  }
}
```
---
## Example
```
class ChatExample extends StatefulWidget {
  const ChatExample({super.key});

  @override
  State<ChatExample> createState() => _ChatExampleState();
}

class _ChatExampleState extends State<ChatExample> {
  final List<ChatMessage> messages = [];

  void sendMessage(String text) {
    setState(() {
      messages.add(ChatMessage(
        text: text,
        type: MessageType.text,
        isSender: true,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Chat Example')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (_, index) {
                final msg = messages[index];
                return ChatBubble(
                  message: msg.text,
                  isSender: msg.isSender,
                  color: msg.isSender ? Colors.blue[200] : Colors.grey[300],
                  textColor: msg.isSender ? Colors.white : Colors.black,
                );
              },
            ),
          ),
          MessageInput(onSend: sendMessage),
        ],
      ),
    );
  }
}

```
---
## ✅ How to Use
* Type a message and press send.
* Click the image icon to pick an image from gallery.
* Messages are displayed with proper sender/receiver bubble.
* Automatic reply “Okay 👍” is shown after 1 second.
---

## 📌 Notes
* Currently, image messages only support local files and network images.
* Auto-reply is simulated; you can replace it with real backend integration.
* Styles are fully customizable in chat_styles.dart.
---
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
---
