import 'package:flutter/material.dart';

class RcgenCard extends StatelessWidget {
  final Widget child; const RcgenCard({super.key, required this.child});
  @override
  Widget build(BuildContext context) => Card(margin: const EdgeInsets.all(8), child: Padding(padding: const EdgeInsets.all(12), child: child));
}
