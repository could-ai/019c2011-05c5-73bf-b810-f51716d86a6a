import 'package:flutter/material.dart';
import '../models/city.dart';
import '../widgets/city_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cities = [
      City(name: 'Paris', imageUrl: 'https://images.unsplash.com/photo-1502602898536-47ad22581b52?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80', tags: ['Capital', 'Tourism'], rating: 4.5),
      City(name: 'Madrid', imageUrl: 'https://images.unsplash.com/photo-1543783207-ec64e4d95325?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80', tags: ['Capital', 'Euro'], rating: 4.2),
      City(name: 'Barcelona', imageUrl: 'https://images.unsplash.com/photo-1583422409516-2895a77efded?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80', tags: ['Tourism', 'Recommended'], rating: 4.7),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Search bar
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search cities...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          // Categories
          const Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            children: ['Capital', 'Recommended', 'Tourism'].map((category) => Chip(label: Text(category))).toList(),
          ),
          const SizedBox(height: 20),
          // Popular cities as cards
          const Text('Popular Cities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: cities.length,
            itemBuilder: (context, index) => CityCard(city: cities[index]),
          ),
        ],
      ),
    );
  }
}