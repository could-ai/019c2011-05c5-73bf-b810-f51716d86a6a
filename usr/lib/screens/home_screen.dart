import 'package:flutter/material.dart';
import '../models/city.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const SizedBox(), // Placeholder for search (navigated separately)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(context, '/search');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? const HomeContent() : Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final popularCities = [City(name: 'Madrid'), City(name: 'Barcelona')];

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Search bar
        TextField(
          decoration: const InputDecoration(
            hintText: 'Search destinations...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Popular Cities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        // Popular cities as buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: popularCities.map((city) => ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/ticket', arguments: city),
            child: Text(city.name),
          )).toList(),
        ),
        const SizedBox(height: 20),
        // City icons below
        const Text('Explore More', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.location_city, size: 40),
              onPressed: () => Navigator.pushNamed(context, '/ticket', arguments: City(name: 'Madrid')),
            ),
            IconButton(
              icon: const Icon(Icons.location_city, size: 40),
              onPressed: () => Navigator.pushNamed(context, '/ticket', arguments: City(name: 'Barcelona')),
            ),
          ],
        ),
      ],
    );
  }
}