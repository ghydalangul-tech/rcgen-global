// lib/pages/child_registration.dart
import 'package:flutter/material.dart';
import 'dart:html' as html; // for launching a mailto on Flutter Web

class ChildRegistrationPage extends StatefulWidget {
  const ChildRegistrationPage({super.key});

  @override
  State<ChildRegistrationPage> createState() => _ChildRegistrationPageState();
}

class _ChildRegistrationPageState extends State<ChildRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final childName = TextEditingController();
  final parentName = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final age = TextEditingController();
  final school = TextEditingController();
  final emergency = TextEditingController();
  final notes = TextEditingController();

  @override
  void dispose() {
    childName.dispose();
    parentName.dispose();
    phone.dispose();
    address.dispose();
    age.dispose();
    school.dispose();
    emergency.dispose();
    notes.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final subject = Uri.encodeComponent('New Child Registration - RCGEN Global');
    final body = Uri.encodeComponent('''
Child Name: ${childName.text}
Parent/Guardian: ${parentName.text}
Phone/WhatsApp: ${phone.text}
Address: ${address.text}
Age: ${age.text}
School: ${school.text}
Emergency Contact: ${emergency.text}

Notes:
${notes.text}
''');

    final mailto =
        'mailto:info@rcgen.org.za?subject=$subject&body=$body';

    // Open default mail app (on web this opens the user’s email composer)
    html.window.open(mailto, '_self');

    // Optional: show a quick message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Opening email to send registration…')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Child Registration')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 8),
                  _h('Child Information'),
                  _t(childName, 'Child Full Name', required: true),
                  Row(
                    children: [
                      Expanded(child: _t(age, 'Age', keyboard: TextInputType.number, required: true)),
                      const SizedBox(width: 12),
                      Expanded(child: _t(school, 'School/Grade')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _h('Parent/Guardian'),
                  _t(parentName, 'Parent/Guardian Name', required: true),
                  Row(
                    children: [
                      Expanded(child: _t(phone, 'Phone / WhatsApp', keyboard: TextInputType.phone, required: true)),
                      const SizedBox(width: 12),
                      Expanded(child: _t(emergency, 'Emergency Contact', keyboard: TextInputType.phone)),
                    ],
                  ),
                  _t(address, 'Home Address', maxLines: 2),
                  const SizedBox(height: 16),
                  _h('Notes'),
                  _t(notes, 'Allergies, medical needs, or other notes', maxLines: 4),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.send),
                    label: const Text('Submit Registration'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helpers
  Widget _h(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      );

  Widget _t(TextEditingController c, String label,
      {bool required = false,
      int maxLines = 1,
      TextInputType? keyboard}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c,
        maxLines: maxLines,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: required
            ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null
            : null,
      ),
    );
  }
}
