import 'screens/child_registration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RcgenGlobalApp());
}

class RcgenGlobalApp extends StatelessWidget {
  const RcgenGlobalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
  title: 'RCGEN Global',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: Scaffold(
    appBar: AppBar(
      title: const Text('RCGEN Global'),
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'RCGEN Global',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ],
      ),
    ),
    body: const HomeScreen(),
  ),
);

  drawer: Drawer(home: Scaffold(
  appBar: AppBar(...)
  drawer: Drawer(...)
  body: const HomeScreen(),
),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('RCGEN Global', style: TextStyle(color: Colors.white, fontSize: 24)),
        ),

        // ✅ ✅ ✅ ADD THIS BUTTON
        ListTile(
          leading: const Icon(Icons.child_care),
          title: const Text('Child Registration'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ChildRegistrationPage()),
            );
          },
        ),

      ],
    ),
  ),
  body: const HomeScreen(),
),

      title: 'RCGEN Global',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
  appBar: AppBar(
    title: const Text('RCGEN Global'),
  ),
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text(
            'RCGEN Global',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        // ✅ Child Registration button
        ListTile(
          leading: const Icon(Icons.child_care),
          title: const Text('child Registration'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ChildRegistrationPage()),
            );
          },
        ),
      ],
    ),
  ),
  body: const HomeScreen(),
),

    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RCGEN Global')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(leading: Icon(Icons.child_care), title: Text('Child Registration')),
          ListTile(leading: Icon(Icons.volunteer_activism), title: Text('Donations')),
          ListTile(leading: Icon(Icons.group), title: Text('Volunteer Sign-Up')),
          ListTile(leading: Icon(Icons.photo_library), title: Text('News & Gallery')),
          ListTile(leading: Icon(Icons.call), title: Text('Contact RCGEN')),
        ],
      ),
    );
  }
}
