import 'package:flutter/material.dart';

import 'screens/contact_list_page.dart';

void main() {
  runApp(const ContactListApp());
}

class ContactListApp extends StatelessWidget {
  const ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(useMaterial3: true),
      home: const ContactListPage(),
    );
  }
}
