import 'package:flutter/material.dart';
import '../models/city.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ticketNumberController = TextEditingController();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final city = ModalRoute.of(context)!.settings.arguments as City;

    return Scaffold(
      appBar: AppBar(title: const Text('Buy Ticket')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // City name and image
            Text(city.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Image.network(city.imageUrl ?? 'https://via.placeholder.com/300', height: 200),
            const SizedBox(height: 20),
            // Form fields
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _ticketNumberController,
                    decoration: const InputDecoration(labelText: 'Ticket Number', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _idController,
                    decoration: const InputDecoration(labelText: 'ID Number', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(labelText: 'Address', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _timeController,
                    decoration: const InputDecoration(labelText: 'Time', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Mock purchase
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ticket purchased!')));
                      }
                    },
                    child: const Text('Purchase Ticket'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Ticket card summary
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Ticket for ${city.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text('Ticket Number: ${_ticketNumberController.text.isEmpty ? 'N/A' : _ticketNumberController.text}'),
                    Text('Name: ${_nameController.text.isEmpty ? 'N/A' : _nameController.text}'),
                    Text('Time: ${_timeController.text.isEmpty ? 'N/A' : _timeController.text}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ticketNumberController.dispose();
    _idController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}