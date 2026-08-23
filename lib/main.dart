import 'package:flutter/material.dart';

void main() {
  runApp(const SthakalpaApp());
}

class SthakalpaApp extends StatelessWidget {
  const SthakalpaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sthakalpa Archtech',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  String _selectedService = 'Architectural Design';

  void _submitBooking() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Booking Successful'),
          content: Text(
            'Thank you ${_nameController.text}!\nOur engineer will contact you shortly regarding $_selectedService.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                _nameController.clear();
                _phoneController.clear();
                _locationController.clear();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sthakalpa Archtech'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal.shade800,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sthakalpa Archtech',
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Design & Construction Solutions',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text('Book Site Visit Engineer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Your Name', border: OutlineInputBorder()),
                    validator: (val) => val == null || val.isEmpty ? 'Enter your name' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
                    validator: (val) => val == null || val.isEmpty ? 'Enter your phone number' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(labelText: 'Site Location', border: OutlineInputBorder()),
                    validator: (val) => val == null || val.isEmpty ? 'Enter site location' : null,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: _selectedService,
                    decoration: const InputDecoration(labelText: 'Project Type', border: OutlineInputBorder()),
                    items: ['Architectural Design', 'Structural Engineering', 'Interior Design', 'Full Construction']
                        .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                        .toList(),
                    onChanged: (val) => setState(() => _selectedService = val!),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      onPressed: _submitBooking,
                      child: const Text('Confirm Booking', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
