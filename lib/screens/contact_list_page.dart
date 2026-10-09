import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  final _formKey = GlobalKey<FormState>();
  var _name = 'Hasan';
  var _phone = '01745-777777';

  final List<Contact> _contacts = [
    Contact('Jawad', '01877-777777'),
    Contact('Ferdous', '01673-777777'),
    Contact('Hasan', '01745-777777'),
    Contact('Hasan', '01745-777777'),
    Contact('Hasan', '01745-777777'),
  ];

  void _addContact() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() {
      _contacts.insert(0, Contact(_name, _phone));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: 'Hasan',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: _requiredField,
                    onSaved: (value) => _name = value!.trim(),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: '01745-777777',
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: _requiredField,
                    onSaved: (value) => _phone = value!.trim(),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _addContact,
                      child: const Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  final contact = _contacts[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        contact.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(contact.phone),
                      trailing: const Icon(Icons.phone),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
