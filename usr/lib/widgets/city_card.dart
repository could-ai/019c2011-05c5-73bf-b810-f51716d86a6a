import 'package:flutter/material.dart';
import '../models/city.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              city.imageUrl ?? 'https://via.placeholder.com/200',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(city.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                // Tags as button-like chips
                Wrap(
                  spacing: 4.0,
                  children: city.tags.map((tag) => Chip(
                    label: Text(tag, style: const TextStyle(fontSize: 12)),
                    backgroundColor: Colors.blue.shade100,
                  )).toList(),
                ),
                const SizedBox(height: 5),
                // Popularity rating
                if (city.rating != null)
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text('${city.rating}', style: const TextStyle(fontSize: 14)),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}