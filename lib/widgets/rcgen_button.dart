import 'package:flutter/material.dart';

class RcgenButton extends StatelessWidget {
  final String label; final VoidCallback onPressed;
  const RcgenButton({super.key, required this.label, required this.onPressed});
  @override
  Widget build(BuildContext context) => ElevatedButton(onPressed: onPressed, child: Text(label));
}
