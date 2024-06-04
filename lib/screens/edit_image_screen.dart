import 'package:flutter/material.dart';
import 'dart:io';
class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key,required this.selectedImage});
  final String selectedImage;

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.selectedImage))
    );
  }
}