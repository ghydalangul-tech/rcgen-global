import 'package:flutter/material.dart';

class RcgenInputField extends StatelessWidget {
  final String hint; final TextEditingController controller;
  const RcgenInputField({super.key, required this.hint, required this.controller});
  @override
  Widget build(BuildContext context) => TextField(controller: controller, decoration: InputDecoration(hintText: hint));
}
