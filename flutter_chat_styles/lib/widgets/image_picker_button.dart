import 'package:flutter/material.dart';

class ImagePickerButton extends StatelessWidget {
  final VoidCallback onTap;

  const ImagePickerButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.image),
      onPressed: onTap,
    );
  }
}
