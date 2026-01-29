import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final Widget icon;
  final TextEditingController controller;
  final bool isPass;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.isPass = false
    ,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

       obscureText: isPass,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
        prefixIcon: icon,
        hintText: hint,
      ),
    );
  }
}
